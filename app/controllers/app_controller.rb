class AppController < ApplicationController
  def home
    @team = current_user.team
    @workouts_this_week = @team.workouts.this_week
  end
end
