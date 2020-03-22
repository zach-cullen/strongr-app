class User < ApplicationRecord
  has_secure_password
  validates :email, presence: true
  validates :email, uniqueness: true
  validates :name, presence: true

  belongs_to :team

  def has_team?
    !!team_id
  end

  def is_coach?
    is_coach 
  end

end
