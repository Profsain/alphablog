class UsersController < ApplicationController
  before_action :set_user, only: [:edit, :update, :show]
  # get all users
  def index
    @users = User.paginate(page: params[:page], per_page: 2)
  end

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
      flash.now[:alert] = "There was a problem with your signup information"
    end
  end

  def edit; end

  def update

    if @user.update(user_params)
      flash[:notice] = "Your profile was updated successfully"
      redirect_to @user
    else
      flash.now[:alert] = "Your update was not successfully"
      render "edit"
    end
  end

  def show
    @articles = @user.articles
  end

  private
  def user_params
    params.require(:user).permit(:username, :email, :password)
  end

  def set_user
    @user = User.find(params[:id])
  end

end