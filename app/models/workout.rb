class Workout < ApplicationRecord
  belongs_to :team

  def date_pretty
    self.date.strftime("%B %-d, %Y")
  end
end
