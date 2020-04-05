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
end
