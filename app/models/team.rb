class Team < ApplicationRecord
  validates :name, presence: true
  has_many :users
  has_many :team_invites
  has_many :workouts
  has_many :workout_metcons, through: :workouts
  has_many :metcons, through: :workout_metcons

end
