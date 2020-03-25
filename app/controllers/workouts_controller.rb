class WorkoutsController < ApplicationController

  def show
    @workout = Workout.find_by(id: params[:id])
  end 

  def new 
    @workout = Workout.new
    @team = current_user.team
  end

  def create
    raise params.inspect
  end 

  def destroy
  end

  private

  def workout_params
    params.require(:workout).allow(:date)
  end

  # WORKOUT FORM PARAMS STRUCTURE 
  # "params" => {
  #   "workout"=>{
  #   "date(1i)"=>"2020", 
  #   "date(2i)"=>"3",
  #   "date(3i)"=>"25", 
  #   "exercise_attributes"=>{
  #     "category"=>"Strength", 
  #     "title"=>"Deadlift", 
  #     "amount"=>"10", 
  #     "amount_unit"=>"reps", 
  #     "score_unit"=>"lbs", 
  #     "rank_by_max"=>"true",
  #     "description"=>"Build to heavy set rest 2 min"}
  #   } 
  # }

end
