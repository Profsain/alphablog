class UsersController < ApplicationController
  before_action :set_user, only: [:edit, :update, :show, :destroy]
  before_action :require_user, except: [:index, :show, :new, :create]
  before_action :require_same_user, only: [:edit, :update, :destroy]

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

  def destroy
    @user.destroy
    flash[:notice] = "User and all articles created by user have been deleted"
    session[:user_id] = nil if @user == current_user
    redirect_to root_path
  end

  private
  def user_params
    params.require(:user).permit(:username, :email, :password)
  end

  def set_user
    @user = User.find(params[:id])
  end

  def require_same_user
    if current_user != @user && !current_user.admin?
      flash[:alert] = "You can only edit or delete your own profile"
      redirect_to @user
    end
  end

end