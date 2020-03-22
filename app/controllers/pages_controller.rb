class PagesController < ApplicationController
  skip_before_action :verify_user
  
  def home
  end
end
