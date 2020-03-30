class Metcon < ApplicationRecord
  has_many :workout_metcons
  has_many :workouts, through: :workout_metcons
  
end
