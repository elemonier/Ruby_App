class SessionsController < ApplicationController
  skip_before_filter :require_user, :only => [:new, :create]

  def new
  end

  def create
  	if User.where(email: params[:session][:email]).exists?
  		user = User.find_by(email: params[:session][:email])
  	end
    if user
      session[:user_id] = user.id
      redirect_to courses_path
    else
      redirect_to signup_path
    end  
  end

  def destroy
    redirect_to root_url
  end

end