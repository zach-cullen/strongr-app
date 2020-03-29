class WorkoutExercisesController < ApplicationController

  def destroy
    #route through :disconnect_exercise. This delete targets the join so that the exercise remains intact when removed form a workout
    #validate that only a coach of team the object belongs to can delete it
    @workout_exercise = WorkoutExercise.find_by(id: params[:id])
    if @workout_exercise && valid_coach?
      @workout = @workout_exercise.workout
      @workout_exercise.destroy
      redirect_to workout_path(@workout)
    else
      redirect_to user_path(current_user)
    end

  end

  def valid_coach?
    #true if the workout_exercise belongs to the user's team and the user is a coach
    @workout_exercise.workout.team == current_user.team && current_user.is_coach? ? true : false
  end

end
