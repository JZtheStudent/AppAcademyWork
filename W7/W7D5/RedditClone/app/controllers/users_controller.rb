class UsersController < ApplicationController
  
  before_action :require_logged_out, only: [:new, :create]
  before_action :require_logged_in, only: [:index]

  def new
    @user = User.new
    render :new
  end

  def index
    @users = User.all
    render :index
  end

  def create
    @user = User.new(user_params)
    if @user.save!
      login(@user)
      redirect_to users_url
    else
      flash[:errors] = @user.error.full_messages
      redirect_to new_user_url
    end
  end

  private

  def user_params
    params.require(:user).permit(:username, :password)
  end

end
