class Exercise < ApplicationRecord
  has_many :workout_exercises
  has_many :workouts, through: :workout_exercises

  def self.categories
    #provides list of acceptable options for exercise categories
    #validation not yet implemented only form
    categories = ["Strength", "Metcon"]
  end

  def self.units
    #provides list of unit options for both amount_unit and score_unit
    #validation not yet implemented only form
    units = ["reps", "lbs", "min:sec", "meters", "calories"]
  end

  def rank_by_text
    #provides text options for select in exercise forms
    self.rank_by_max ? "max" : "min"
  end

end
