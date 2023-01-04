class UsersController < ApplicationController

  # get all users
  def index
    @users = User.all
  end

  def new
    @user = get_user
  end

  def create
    @user = get_user
    if @user.save
      session[:user_id] = @user.id
      flash[:success] = "Welcome to Alpha blog #{@user.username}! You have successfully signed up"

      redirect_to articles_path
    else
      render 'new'
      flash[:alert] = "There was a problem with your signup information"
    end
  end

  def edit
    @user = get_user
  end

  def update
    @user = get_user

    if @user.update(user_params)
      flash[:notice] = "Your profile was updated successfully"
      redirect_to @user
    else
      render "edit"
    end
  end

  def show
    @user = get_user
    @articles = @user.articles
  end

  private
  def user_params
    params.require(:user).permit(:username, :email, :password)
  end

  def get_user
    User.find(params[:id])
  end

end