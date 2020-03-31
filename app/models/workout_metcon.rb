class WorkoutMetcon < ApplicationRecord
  belongs_to :workout
  belongs_to :metcon 
  has_many :workout_metcon_scores
end
