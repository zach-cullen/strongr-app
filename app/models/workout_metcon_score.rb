class WorkoutMetconScore < ApplicationRecord
  belongs_to :workout_metcon
  belongs_to :user

  def format_and_update_score(score_attributes)
    if !!score_attributes[:score]
      if !score_attributes[:score].blank?
        self.update(score: score_attributes[:score])
      end
    elsif !!score_attributes[:min]
      min = 0
      min = score_attributes[:min].to_i unless score_attributes[:min].blank?
      sec = 0
      sec = score_attributes[:sec].to_i unless score_attributes[:sec].blank?
      score_in_seconds = (60 * min) + sec 
      self.update(score: score_in_seconds)
    end
  end

  def metcon
    self.workout_metcon.metcon
  end

  def score_formatted
    if self.metcon.score_by == "time"
      score_time_format
    elsif self.metcon.score_by == "reps"
      score_rep_format
    end
  end

  def score_time_format
    min = self.score / 60
    sec = self.score % 60
    format = "#{min}:#{sec}"
  end

  def score_rep_format
    format = "#{score} reps"
  end

  def min
    #pass through for scoring timed workouts, form will break if delete
  end

  def sec
    #pass through for scoring timed workouts, form will break if delete
  end 
end
