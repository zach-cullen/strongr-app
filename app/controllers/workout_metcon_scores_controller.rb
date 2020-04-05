class WorkoutMetconScoresController < ApplicationController

  def create
    
    byebug
  end

  private

  def score_params
    params.require(:workout_metcon_score).permit(:score, :min, :sec)
  end
end
