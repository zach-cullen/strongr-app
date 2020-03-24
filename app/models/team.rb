class Team < ApplicationRecord
  validates :name, presence: true
  has_many :users
  has_many :team_invites
  has_many :workouts
  has_many :workout_exercises, through: :workouts
  has_many :exercises, through: :workout_exercises
end
