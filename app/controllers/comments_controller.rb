class CommentsController < ApplicationController
  before_action :required_sign_in

  # def new
  #   @post = Post.find(params[:post_id]);
  #   @comment = Comment.new
  # end

  def create
    #need to link to posts tomorrow
    @comment = current_user.comments.new(comment_params)

    if @comment.save

      redirect_to comment_url(@comment)
    else
      @post = Post.find(params[:post_id])
      flash.now[:errors] = @comment.errors.full_messages
      render :new
    end
  end

  # def edit
  #   @comment = Comment.find(params[:id])
  # end

  # def update
  #   @comment = Comment.find(params[:id])
  #   @comment.author_id = current_user.id
  #   if @comment.update(comment_params)
  #     redirect_to comment_url(@comment)
  #   else
  #     flash[:errors] = @comment.errors.full_messages
  #     render :edit
  #   end
  # end
  #
  # def show
  #   @comment = Comment.find(params[:id]);
  #   @author = User.find(@comment.author_id);
  # end


  def destroy
    @comment = Comment.find(params[:id]);
    @comment.destroy
    redirect_to post_url(params[:post_id])
  end


  private
  def comment_params
    params.require(:comment).permit(:parent_comment_id, :body);
  end
end
