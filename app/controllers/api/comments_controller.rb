class Api::CommentsController < ApplicationController
  before_action :required_sign_in

  def create
    #need to link to posts tomorrow
    @comment = current_user.comments.new(comment_params)

    unless @comment.save
      flash.now[:errors] = @comment.errors.full_messages
    end
    render :json => {}
  end


  def update
    @comment = Comment.find(params[:id])
    @comment.author_id = current_user.id
    unless @comment.update(comment_params)
      flash[:errors] = @comment.errors.full_messages
    end
    render :json => {}
  end


  def destroy
    @comment = Comment.find(params[:id])
    post_id = @comment.post_id
    @comment.destroy
    render :json => {}
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
    render :json => {votes: @comment.votes}
  end

  private
  def comment_params
    params.require(:comment).permit(:post_id, :parent_comment_id, :body);
  end
end
