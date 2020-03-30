class WorkoutsController < ApplicationController

  def show
    @workout = Workout.find_by(id: params[:id])
    # @exercises = @workout.exercises
  end 

  def new 
    @team = current_user.team
    @workout = Workout.new
    # 2.times { @workout.exercises.build }
    
  end

  def create
    @team = current_user.team
    #give workout team_id prior to saving since not included in params
    @workout = @team.workouts.build(workout_params)

    if @workout.save 
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

  private

  def workout_params
    params.require(:workout).permit("date(1i)", "date(2i)", "date(3i)")
    # params.require(:workout).permit(
    #   "date(1i)", "date(2i)", "date(3i)", 
    #   :exercises_attributes => [
    #     :category,
    #     :title,
    #     :amount,
    #     :amount_unit,
    #     :score_unit,
    #     :rank_by_max,
    #     :description
    #   ]
    # ) 
  end

  # WORKOUT FORM PARAMS STRUCTURE 
  # "params" => {
  #   "workout"=>{
  #     "date(1i)"=>"2020", 
  #     "date(2i)"=>"3",
  #     "date(3i)"=>"25",  
  #     "exercise_attributes"=>{
  #       "0"=>{
  #         "category"=>"Strength", 
  #         "title"=>"Deadlift", 
  #         "amount"=>"10", 
  #         "amount_unit"=>"reps", 
  #         "score_unit"=>"lbs", 
  #         "rank_by_max"=>"true",
  #         "description"=>"Build to heavy set rest 2 min"
  #       }, 
  #       "1"=>{
  #         "category"=>"Metcon", 
  #         "title"=>"Fran", 
  #         "amount"=>"", 
  #         "amount_unit"=>"", 
  #         "score_unit"=>"time", 
  #         "rank_by_max"=>"false",
  #         "description"=>"21-15-9 reps for time\nThrusters (95/65)\nPullups"
  #       }
  #     }
  #   } 
  # }

end
