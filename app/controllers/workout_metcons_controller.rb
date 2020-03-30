class WorkoutMetconsController < ApplicationController
  before_action :permit_coach

  def destroy
    @workout_metcon = WorkoutMetcon.find_by(id: params[:id])
    #cache workout prior to deleting join for validation and redirect
    @workout = @workout_metcon.workout
    if @workout.team == current_user.team
      #deletes join model and redirects to page rendering the original workout
      @workout_metcon.destroy
      redirect_to workout_path(@workout)
    else
      redirect_to user_path(current_user)
    end
  end
end
