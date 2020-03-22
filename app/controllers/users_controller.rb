class UsersController < ApplicationController
  validates :email, presence: true
  validates :email, uniqueness: true
  
  def new
    @user = User.new
  end

  def create
    @user = User.new(email: params[:user][:email])

  end
end
