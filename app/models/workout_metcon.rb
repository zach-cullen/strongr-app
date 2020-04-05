class WorkoutMetcon < ApplicationRecord
  belongs_to :workout
  belongs_to :metcon 
  has_many :workout_metcon_scores
  accepts_nested_attributes_for :workout_metcon_scores

  def find_or_build_user_score(user)
    score = self.workout_metcon_scores.find_by(user_id: user.id)
    if !!score
      score
    else 
      self.workout_metcon_scores.build(user_id: user.id)
    end
  end

  def user_score(user)
    #returns score object for a particular user or nil
    score = self.workout_metcon_scores.find_by(user_id: user.id)
  end

  def completed_by_user?(user)
    #checks for a score object for user if found, and returns true only if the score object has a recorded score not nil
    score = user_score(user)
    if score
      !!score.score
    else
      false
    end
  end
end
