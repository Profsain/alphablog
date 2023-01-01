class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      flash[:success] = "Welcome to Alpha blog #{@user.username}! You have successfully signed up"

      redirect_to articles_path
    else
      render 'new'
      flash[:alert] = "There was a problem with your signup information"
    end
  end

  private
  def user_params
    params.require(:user).permit(:username, :email, :password)
  end

end