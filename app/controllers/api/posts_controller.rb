class Api::PostsController < ApplicationController

  before_action :required_sign_in

  def new
    @sub = Sub.find(params[:sub_id]);

    render :new
  end

  def create
    #need to link to subs tomorrow

    @post = current_user.posts.new(post_params)
    url = @post.url
    @post.url = "http://" + url unless (url[0..6] == "http://") || (url[0..7] == "https://")
    if @post.save
      Posting.create({sub_id: params[:sub_id], post_id: @post.id})

      render :json => {post_id: @post.id}
    else
      @sub = Sub.find(params[:sub_id])
      flash.now[:errors] = @post.errors.full_messages
      render :new
    end
  end

  def edit
    @post = Post.find(params[:id])
    render :json => @post
  end

  def update
    @post = Post.find(params[:id])
    @post.author_id = current_user.id

    if @post.update(post_params)
      render :json => params[:sub_id]
    else
      flash[:errors] = @post.errors.full_messages
      render :edit
    end
  end

  def show
    @post = Post.find(params[:id]);
    @author = @post.author;
    @comments_by_parent =  @post.comments_by_parent
    @author_by_comment = @post.author_by_post_comment
    @votes = @post.votes_by_comment
    @subs = @post.subs;

    render :show
  end


  def destroy
    #dont destroy the actual post destroy the posting only instead
    @posting = Posting.find_by({post_id: params[:id], sub_id: params[:sub_id]});
    if @posting.destroy
      render json: {}
    else
      render json: @posting.errors.full_messages, status: :unprocessable_entity
    end

  end

  def change_img_url
    @post = Post.find(params[:id]);
    @post.save_img_url;
    render :json => {img_url: @post.img_url}
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

  def xpost
    @post = Post.find(params[:id])
    @sub = Sub.find_by({title: params[:title] });
    @posting = Posting.find_by( {sub_id: @sub.id, post_id: @post.id})

    unless @posting
      Posting.create({sub_id: @sub.id, post_id: @post.id });
    end

    render :json => {}
  end

  private
  def post_params
    params.require(:post).permit(:title, :url, :body, :user_id, :sub_id, :address, :latitude, :longitude);
  end


end
