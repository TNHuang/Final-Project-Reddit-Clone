class Api::SubsController < ApplicationController
  before_action :required_sign_in

  def index
    @subs = Sub.all
    @subber_count = Sub.subscribers_count_by_sub
    @is_mod = current_user.sub_mod_by_current_user?
    @votes_by_sub = Sub.votes_count_by_sub
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
      render :index
    else
      flash.now[:errors] = @sub.errors.full_messages
      render :new
    end
  end

  def show
    @sub = Sub.find(params[:id])

    # @votes_by_post = Post.votes_count_by_post(@sub)
    # @is_author = current_user.post_by_current_user?
    # @authors = Post.author_by_post_sub(@sub)
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

  private
  def subs_params
    params.require(:sub).permit(:name, :title, :description);
  end

end
