class ExercisesController < ApplicationController
  
  def show
    @exercise = Exercise.find_by(id: params[:id])
  end

  def new
  end

  def create

  end

  def destroy
  end
end
