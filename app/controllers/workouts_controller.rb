class WorkoutsController < ApplicationController

  def show
    @workout = Workout.find_by(id: params[:id])
  end 

  def new
  end

  def create
  end 

  def destroy
  end

end
