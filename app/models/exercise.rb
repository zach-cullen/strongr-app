class Exercise < ApplicationRecord

  def rank_by_text
    self.rank_by_max ? "max" : "min"
  end
end
