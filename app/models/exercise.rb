class Exercise < ApplicationRecord
  has_many :workout_exercises
  has_many :workouts, through: :workout_exercises

  def rank_by_text
    self.rank_by_max ? "max" : "min"
  end
end
