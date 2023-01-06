class ApplicationController < ActionController::Base
  
  helper_method :current_user, :logged_in?

  # find the current_user in the session
  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def logged_in?
    !!current_user
  end

  # restrict_access to url request from the browser
  def require_user
    if !logged_in?
      flash[:alert] = "You must be logged in to perform that action"
      redirect_to login_path
    end
  end
  
end
