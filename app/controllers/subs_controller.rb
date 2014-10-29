class SubsController < ApplicationController
  before_action :required_sign_in

  def index
    @subs = Sub.all
  end

  def new
    @sub = Sub.new
  end

  def create
    @sub = Sub.new(subs_params)
  
    if @sub.save
      Modding.create({moderator_id: current_user.id, sub_id: @sub.id})
      redirect_to sub_url(@sub)
    else
      flash.now[:errors] = @sub.errors.full_messages
      render :new
    end
  end

  def show
    @sub = Sub.find(params[:id]);
  end

  def edit
    @sub = Sub.find(params[:id])
  end

  def update
    @sub = Sub.find(params[:id])
    if @sub.update(subs_params)
      redirect_to sub_url(@sub)
    else
      flash[:errors] = @sub.errors.full_messages
      render :edit
    end
  end

  def destroy
    @sub = Sub.find(params[:id]);
    @sub.destroy
    redirect_to subs_url
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
    redirect_to subs_url
  end
  
  private
  def subs_params
    params.require(:sub).permit(:name, :title, :description);
  end

end
