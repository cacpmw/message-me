class SessionsController < ApplicationController
  before_action :logged_in_redirect, only: %i[new create]
  def new; end

  def create
    user = User.find_by(username: params[:session][:username])
    if user && user.authenticate(params[:session][:password])
      session[:user] = user
      flash[:success] = 'Welcome'
      redirect_to root_path
    else
      flash.now[:error] = 'Wrong credentials'
      render 'new'
    end
  end

  def destroy
    session[:user] = nil
    flash[:success] = 'See you later'
    redirect_to login_path
  end

  private

  def logged_in_redirect
    redirect_to root_path if logged_in?
  end
end
