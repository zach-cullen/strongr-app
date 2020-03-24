class Workout < ApplicationRecord
  belongs_to :team
  has_many :workout_exercises
  has_many :exercises, through: :workout_exercises


  def date_pretty
    self.date.strftime("%B %-d, %Y")
  end
end
