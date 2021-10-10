class UsersController < ApplicationController

    def index  
    debugger
      if params[:username].blank?
        @users = User.all 
      elsif params[:query]
        @users = User.where(username: params[:username])
      end
      render json: @users
      
    end
  
    def create
      @user = User.new(user_params)
      if @user.save
        redirect_to users_url(@user)
      else
        render json: @user.errors.full_messages, status: 422
      end
    end
    
    def show
      @user = User.find(params[:id])
      render json: @user
    end
    
    def update
      @user = User.find_by(id: params[:id])
      if @user.update(user_params)
        redirect_to user_url(@user)
      else  
        render json: @user.errors.full_messages, status: 422
      end
    end 
    
    def destroy
      @user = User.find_by(id: params[:id])
      if @user 
        @user.destroy 
        render json: @user
      else
        render json: { error: "User doesn't exist"}
      end
    end

    private
    def user_params
        params.require(:user).permit(:username)
    end

end