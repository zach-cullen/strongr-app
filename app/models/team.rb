class Team < ApplicationRecord
  validates :name, presence: true
  has_many :users
  has_many :team_invites
  has_many :workouts

end
