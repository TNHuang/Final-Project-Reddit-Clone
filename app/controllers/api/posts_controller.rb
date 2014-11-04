class Api::PostsController < ApplicationController

  before_action :required_sign_in

  def new
    # @sub = Sub.find(params[:sub_id]);

    render :new
  end

  def create
    #need to link to subs tomorrow
    @post = current_user.posts.new(post_params)
    url = @post.url
    @post.url = "http://" + url unless (url[0..6] == "http://") || (url[0..7] == "https://")

    if @post.save
      Posting.create({sub_id: params[:sub_id], post_id: @post.id})
      render :json => params[:sub_id]
    else
      @sub = Sub.find(params[:sub_id])
      flash.now[:errors] = @post.errors.full_messages
      render :new
    end
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    @post.author_id = current_user.id
    if @post.update(post_params)
      render :json => Sub.find(params[:sub_id])
    else
      flash[:errors] = @post.errors.full_messages
      render :edit
    end
  end

  def show
    @post = Post.find(params[:id]);
    @author = User.find(@post.author_id);
  end


  def destroy
    #dont destroy the actual post destroy the posting only instead
    @posting = Posting.find_by({post_id: params[:id], sub_id: params[:sub_id]});
    @posting.destroy
    redirect_to sub_url(params[:sub_id])
  end

  def downvote
    vote(-1);
  end

  def upvote
    vote(1);
  end

  def vote(dir)
    @post = Post.find(params[:id])
    @user_vote = UserVote.find_by( {votable_id: @post.id, votable_type: "Post", user_id: current_user.id})
    #to prevent double vote, search for existing vote first
    if @user_vote
      @user_vote.update(value: dir)
    else
      @post.user_votes.create!(user_id: current_user.id, value: dir)
    end
    render :json => {votes: @post.votes}
  end

  private
  def post_params
    params.require(:post).permit(:title, :url, :body, :user_id, sub_id: []);
  end


end
