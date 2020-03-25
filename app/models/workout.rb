class Workout < ApplicationRecord
  belongs_to :team
  has_many :workout_exercises
  has_many :exercises, through: :workout_exercises

  def exercise_attributes=(attributes)
    # accepts nested attributes from new workout form for finding or creating new exercise to add to workout
    exercise = self.team.exercises.find_by(
      title: attributes[:title],
      amount: attributes[:amount],
      amount_unit: attributes[:amount_unit],
      score_unit: attributes[:score_unit]
    )
    # custom find or create to allow description to be updated each time
    if !!exercise 
      exercise.update(description: attributes[:description])
      self.exercises << exercise
    else
      self.exercises.build(attributes)
      self.save
    end
  end

  def date_pretty
    self.date.strftime("%B %-d, %Y")
  end
end
