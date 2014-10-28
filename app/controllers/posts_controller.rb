class PostsController < ApplicationController

  before_action :required_sign_in

  def new
    @sub = Sub.find(params[:sub_id]);
    @post = Post.new
  end

  def create
    #need to link to subs tomorrow
    @post = current_user.posts.new(post_params)
    url = @post.url
    @post.url = "http://" + url unless (url[0..6] == "http://") || (url[0..7] == "https://")

    if @post.save

      Posting.create({sub_id: params[:sub_id], post_id: @post.id})
      redirect_to post_url(@post)
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
      redirect_to post_url(@post)
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
    @post = Post.find(params[:id]);
    @post.destroy
    redirect_to sub_url(params[:sub_id])
  end


  private
  def post_params
    params.require(:post).permit(:title, :url, :body);
  end
end
