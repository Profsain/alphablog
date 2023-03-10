class SessionsController < ApplicationController
  def new
  end

  # post login form 
  def create
    user = User.find_by(email: params[:session][:email].downcase)

    if user && user.authenticate(params[:session][:password])
      session[:user_id] = user.id
      flash[:success] = "Welcome #{user.username}! You have successfully logged in"
      redirect_to user_path(user)
    else
      flash.now[:danger] = "There was something wrong with your login information"
      render 'new'
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:notice] = "Auf Wiedersehen! You have successfully logged out"
    redirect_to root_path
  end
end