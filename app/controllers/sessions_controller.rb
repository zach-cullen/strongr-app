class SessionsController < ApplicationController
  skip_before_action :verify_user, only: [:new, :create, :destroy]

  def new 
  end

  def create
    user = User.find_by(email: params[:email])
    authenticated = user.try(:authenticate, params[:password])
    if authenticated
      session[:user_id] = authenticated.id
      redirect_to user_path(authenticated)
    else
      redirect_to :login
      flash[:alert] = "Sorry, invalid email and password combination"
    end 
  end

  def destroy
    session[:user_id] = nil
    session[:recently_edited_workout_id] = nil
    flash[:alert] = "You have been logged out."
    redirect_to :login
  end

end
