class User < ApplicationRecord
  has_secure_password
  validates :email, presence: true
  validates :email, uniqueness: true
  validates :name, presence: true
  
  has_many :team_invites
  belongs_to :team, optional: true 

  def has_team?
    !!team_id
  end

  def is_coach?
    is_coach 
  end

  def make_coach
    self.is_coach = true
    self.save
  end

end
