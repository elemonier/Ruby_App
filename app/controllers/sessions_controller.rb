class SessionsController < ApplicationController
  skip_before_filter :require_user, :only => [:new, :create]

  def new
  end

  def create
	user = User.where(email: params[:session][:email]).first
    if user
      session[:user_id] = user.id
      redirect_to courses_path
    else
      redirect_to signup_path
    end  
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url
  end

end