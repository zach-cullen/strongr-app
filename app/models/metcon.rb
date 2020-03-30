class Metcon < ApplicationRecord
  has_many :workout_metcons
  has_many :workouts, through: :workout_metcons
  validates :score_by, inclusion: { in: ["time", "reps"] }
  
  def self.score_types
    #provides valid score_types to form
    score_types = ["time", "reps"]
  end
end
