class Api::SubsController < ApplicationController
  before_action :required_sign_in
  require 'pusher'
  Pusher.url = "http://970a77788f6f31997f46:6ac8066efbc5e2f4b3ea@api.pusherapp.com/apps/95929"

  def index

    @subs = Sub.all
    @subber_count = Sub.subscribers_count_by_sub
    @is_mod = current_user.sub_mod_by_current_user?
    @votes_by_sub = Sub.votes_count_by_sub
    @is_subscribe = current_user.subscribed_sub_by_user

    render :index
  end

  def new
    @sub = Sub.new
    render :new
  end

  def create
    @sub = Sub.new(subs_params)

    if @sub.save
      Modding.create({moderator_id: current_user.id, sub_id: @sub.id})
      # @subber_count = Sub.subscribers_count_by_sub
      # @is_mod = current_user.sub_mod_by_current_user?
      # @votes_by_sub = Sub.votes_count_by_sub
      render :show
    else
      flash.now[:errors] = @sub.errors.full_messages
      render :new
    end
  end

  def show
    @sub = Sub.find(params[:id])
    @sub_count = @sub.subscribers.count
    @votes_by_post = Post.votes_count_by_post(@sub)
    @is_author = current_user.post_by_current_user?
    @authors = Post.author_by_post_sub(@sub)
    @posts, @mods = @sub.sub_with_posts_and_moderators
    render :show
  end

  def edit
    @sub = Sub.find(params[:id])
    render :edit
  end

  def update
    @sub = Sub.find(params[:id])
    if @sub.update(subs_params)
      # @subber_count = Sub.subscribers_count_by_sub
      # @is_mod = current_user.sub_mod_by_current_user?
      # @votes_by_sub = Sub.votes_count_by_sub
      render :index
    else
      flash[:errors] = @sub.errors.full_messages
      render :edit
    end
  end

  def destroy
    @sub = Sub.find(params[:id]);
    # Modding.where({sub_id: @sub.id}).destroy_all
    @sub.destroy

    # @subber_count = Sub.subscribers_count_by_sub
    # @is_mod = current_user.sub_mod_by_current_user?
    # @votes_by_sub = Sub.votes_count_by_sub
    render :index
  end

  def downvote
    vote(-1);
  end

  def upvote
    vote(1);
  end

  def vote(dir)
    @sub = Sub.find(params[:id])
    @user_vote = UserVote.find_by( {votable_id: @sub.id, votable_type: "Sub", user_id: current_user.id})
    #to prevent double vote, search for existing vote first
    if @user_vote
      @user_vote.update(value: dir)
    else
      @sub.user_votes.create!(user_id: current_user.id, value: dir)
    end

    # @subber_count = Sub.subscribers_count_by_sub
    # @is_mod = current_user.sub_mod_by_current_user?
    # @votes_by_sub = Sub.votes_count_by_sub
    render :json => {votes: @sub.votes}
  end

  def subscribe
    @sub = Sub.find(params[:id])
    @subscription = Subscription.find_by({ subscriber_id: current_user.id,
                                            sub_id: @sub.id });
    unless @subscription
      Subscription.create({ subscriber_id: current_user.id, sub_id: @sub.id})
    end

    render :json => {is_subscribe: true}
  end

  def unsubscribe
    @sub = Sub.find(params[:id])
    @subscription = Subscription.find_by({ subscriber_id: current_user.id,
                                            sub_id: @sub.id });
    if @subscription
      @subscription.destroy;
    end
    render :json => {is_subscribe: false}
  end

  def multisearch
    args = params[:search_val]
    # args = "space"
    @found_subs, @found_posts = current_user.multi_search_by(args)

    render :search
  end

  def chat
    message = params[:message]
    author = params[:author]
    Pusher['reddit_channel'].trigger('chat_event', {
      message: message,
      author: author
    })
    render :json => {answer: "message recieved"}
  end

  private
  def subs_params
    params.require(:sub).permit(:name, :title, :description);
  end



end
