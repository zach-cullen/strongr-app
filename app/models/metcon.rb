class Metcon < ApplicationRecord
  has_many :workout_metcons
  has_many :workouts, through: :workout_metcons
  has_many :workout_metcon_scores, through: :workout_metcons
  accepts_nested_attributes_for :workouts
  validates :score_by, inclusion: { in: ["time", "reps"] }

  def workout_id=(attributes)
    #pass through and do nothing, see metcon controller create with workout_id
  end

  def self.score_types
    #provides valid score_types to form
    score_types = ["time", "reps"]
  end
end
