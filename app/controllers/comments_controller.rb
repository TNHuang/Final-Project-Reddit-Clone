class CommentsController < ApplicationController
  before_action :required_sign_in
  
  def new
      @comment = Comment.new(post_id: params[:post_id])
      render :new
  end

  def create
    #need to link to posts tomorrow
    @comment = current_user.comments.new(comment_params)

    if @comment.save
      redirect_to post_url(@comment.post_id)
    else
      flash.now[:errors] = @comment.errors.full_messages
      redirect_to new_post_comment_url(@comment.post_id)
    end
  end

  def edit
    @comment = Comment.find(params[:id])
  end

  def update
    @comment = Comment.find(params[:id])
    @comment.author_id = current_user.id
    if @comment.update(comment_params)
      redirect_to edit_post_comment_url(@comment.post_id)
    else
      flash[:errors] = @comment.errors.full_messages
      render :edit
    end
  end

  def show
    @comment = Comment.find(params[:id]);
    # @author = User.find(@comment.author_id);
    @new_comment = Comment.new( { post_id: @comment.post_id, parent_comment_id: @comment.id })
    render :show
  end


  def destroy
    @comment = Comment.find(params[:id])
    post_id = @comment.post_id
    @comment.destroy
    redirect_to new_post_comment_url(post_id)
  end
  
  def downvote
    vote(-1);
  end
  
  def upvote
    vote(1);
  end
  
  def vote(dir)
    @comment = Comment.find(params[:id])
    @user_vote = UserVote.find_by( {votable_id: @comment.id, votable_type: "Comment", user_id: current_user.id})
    #to prevent double vote, search for existing vote first
    if @user_vote
      @user_vote.update(value: dir)
    else
      @comment.user_votes.create!(user_id: current_user.id, value: dir)  
    end
    redirect_to post_url(@comment.post_id)
  end
  
  private
  def comment_params
    params.require(:comment).permit(:post_id, :parent_comment_id, :body);
  end
end
