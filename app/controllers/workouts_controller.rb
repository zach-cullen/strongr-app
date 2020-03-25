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

end
