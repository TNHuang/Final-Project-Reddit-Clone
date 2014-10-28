class PostsController < ApplicationController

  before_action :required_sign_in

  def index
    @posts = Post.all
  end

  def new
    @sub = Sub.find(params[:sub_id]);
    @post = Post.new
  end

  def create
    #need to link to subs tomorrow
    @post = @sub.Post.new(post_params)
    @post.author_id = current_user.id
    if @post.save
      redirect_to post_url(@post) #change to the correct url once you finish posting
    else
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
  end


  def destroy
    @post = Post.find(params[:id]);
    @post.destroy
    redirect_to sub_url(@post.sub_id)
  end


  private
  def post_params
    params.require(:post).permit(:title, :url, :body);
  end
end
