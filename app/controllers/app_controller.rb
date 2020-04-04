class AppController < ApplicationController
  before_action :validate_has_team

  def home
    @team = current_user.team
    @workouts_this_week = @team.workouts.this_week
  end

  def wod
    @team = current_user.team
    @workout = @team.workout_of_the_day
    if @workout
      redirect_to workout_path(@workout)
    else
      redirect_to 'app/home'
    end
  end

  def validate_has_team
    redirect_to user_path(current_user) if !current_user.has_team?
  end
end
