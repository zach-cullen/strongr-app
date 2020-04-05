class WorkoutMetconScoresController < ApplicationController

  def create
    @workout_metcon = WorkoutMetcon.find_by(id: score_params[:workout_metcon_id])
    if score_workout_team_valid
      @score = @workout_metcon.workout_metcon_scores.build(user_id: current_user.id)
      @score.format_and_update_score(score_params)
      redirect_to workout_path(@workout_metcon.workout)
    else 
      redirect_to :app_home
    end
  end

  def score_workout_team_valid
    @workout_metcon && @workout_metcon.workout.team == current_user.team
  end

  private

  def score_params
    params.require(:workout_metcon_score).permit(:score, :min, :sec, :workout_metcon_id)
  end
end
