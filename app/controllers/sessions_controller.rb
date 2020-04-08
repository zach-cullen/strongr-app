class SessionsController < ApplicationController
  skip_before_action :verify_user, only: [:new, :create, :destroy, :google_login]

  def new 
  end

  def create
    user = User.find_by(email: params[:email])
    authenticated = user.try(:authenticate, params[:password])
    if authenticated
      session[:user_id] = authenticated.id
      redirect_to :app_home
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


  def google_login
    user_info = request.env['omniauth.auth'][:info]
    #find user by email or create new user with email
    @user = User.find_or_create_by(email: user_info[:email]) do |u|
      u.update(name: user_info[:name], password: SecureRandom.hex)
    end 
    #log user in
    if @user.persisted?
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      redirect_to :root
    end
  end

end
