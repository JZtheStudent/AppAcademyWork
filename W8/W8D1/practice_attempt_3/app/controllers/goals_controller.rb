class GoalsController < ApplicationController
  
  before_action :require_logged_in, only: [:create, :destroy]

  def create 
    @goal = Goal.new(goal_params)
    @goal.user_id = params[:user_id]
    unless @goal.save
      flash[:errors] = @goal.errors.full_messages
    end 
    redirect_to user_url(@goal.user)

  end

  def destroy 
    @goal = current_user.goals.find_by(id: params[:id])
    if @goal 
      @goal.destroy 
    end
    redirect_to users_url
  end

  private 
  def goal_params 
    params.require(:goal).permit(:name, :details, :status)
  end

end