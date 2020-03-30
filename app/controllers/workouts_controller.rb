class WorkoutsController < ApplicationController
  before_action :permit_coach, only: [:new, :create]

  def show
    @workout = Workout.find_by(id: params[:id])
    # @exercises = @workout.exercises
  end 

  def new 
    @team = current_user.team
    @metcons_list = current_user.team.metcons_list
    @workout = Workout.new
    @workout.metcons.build
    # 2.times { @workout.exercises.build }
  end

  def create
    @team = current_user.team
    #give workout team_id prior to saving since not included in params
    @workout = @team.workouts.build
    #see workout #metcons_attributes 
    if @workout.valid?
      @workout.update(workout_params)
      redirect_to workout_path(@workout)
    else
      redirect_to new_workout_path
    end 
  end 

  def edit
    @team = current_user.team
    @workout = Workout.find_by(id: params[:id])
    # @workout_exercises = WorkoutExercise.where(workout_id: @workout.id)
    # @exercise = Exercise.new
  end

  def update

  end

  def destroy
    
  end

  def permit_coach
    if !current_user.is_coach?
      redirect_to user_path(current_user)
    end
  end

  private

  def workout_params
    params.require(:workout).permit(
      "date(1i)", "date(2i)", "date(3i)",
      :metcons_attributes => [
        :title,
        :description,
        :score_by
      ]
    )
  end

end
