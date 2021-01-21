class ApplicationController < ActionController::Base
  helper_method :current_user, :logged_in?
  def current_user
    user = User.new(session[:user]) if session[:user]
    @current_user ||= User.find(user.id) if user
  end

  def logged_in?
    !!current_user
  end

  def require_user
    unless logged_in?
      flash[:error] = 'You must be logged in to perform this action'
      redirect_to login_path
    end
  end
end
