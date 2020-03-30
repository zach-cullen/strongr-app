class ApplicationController < ActionController::Base
  protect_from_forgery
  before_action :verify_user
  helper_method :current_user
  helper_method :permit_coach

  def verify_user
    redirect_to :root unless user_is_authenticated
  end

  def user_is_authenticated
    !!current_user
  end

  def current_user
    user ||= User.find_by(id: session[:user_id])
  end

  def permit_coach
    if !current_user.is_coach?
      redirect_to user_path(current_user)
    end
  end
end
