class Workout < ApplicationRecord
  belongs_to :team
  has_many :workout_metcons, :dependent => :delete_all
  has_many :metcons, through: :workout_metcons
  accepts_nested_attributes_for :metcons

  def metcons_attributes=(metcons_attributes)
    metcons_attributes.values.each do |attributes|
      #make sure metcon only built if form filled in for section (since multiple are optional)
      if !attributes[:title].blank?
        #check if metcon already exists by title
        metcon = Metcon.find_by(title: attributes[:title])
        if metcon 
          self.metcons << metcon
        else 
          self.metcons.build(attributes)
          self.save
        end
      end
    end
  end
  # has_many :workout_exercises
  # has_many :exercises, through: :workout_exercises
  # accepts_nested_attributes_for :exercises

  # def exercises_attributes=(attributes)
  #   # accepts nested attributes from new workout form for finding or creating new exercise to add to workout
  #   #iterate over multiple collections of exercise attributes as exercise_hash
  #   attributes.values.each do |exercise_hash|
  #     #if one of the exercises is left blank skip that section
  #     if !exercise_hash[:title].blank?
  #       # finds if exercise already exists in certain combination of attributes
  #       exercise = self.team.exercises.find_by(
  #         title: exercise_hash[:title],
  #         amount: exercise_hash[:amount],
  #         amount_unit: exercise_hash[:amount_unit],
  #         score_unit: exercise_hash[:score_unit]
  #       )
  #       # if exercise already exists, updates descripiton only, else creates a new exercise
  #       if !!exercise 
  #         exercise.update(description: exercise_hash[:description])
  #         self.exercises << exercise
  #       else
  #         self.exercises.build(exercise_hash)
  #         self.save
  #       end
  #     end
  #   end
  # end

  def date_pretty
    self.date.strftime("%B %-d, %Y")
  end
end
