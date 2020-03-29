class Team < ApplicationRecord
  validates :name, presence: true
  has_many :users
  has_many :team_invites
  has_many :workouts

  def exercises_list
    self.exercises.order(:title).select(:title).distinct
  end
end
