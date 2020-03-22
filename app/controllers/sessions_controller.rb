class SessionsController < ApplicationController

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
  end

end
