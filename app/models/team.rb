class Team < ApplicationRecord
  validates :name, presence: true
  has_many :users
  has_many :team_invites
  has_many :workouts
  has_many :workout_metcons, through: :workouts
  has_many :metcons, through: :workout_metcons

  def metcons_list
    #returns an alphabetically ordered array of distinct metcon titles specific to the team
    metcons_titles = self.metcons.order(:title).select(:title).distinct.collect {|m| m.title}
  end
end
