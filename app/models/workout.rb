class Workout < ApplicationRecord
  belongs_to :team
  has_many :workout_metcons, :dependent => :delete_all
  has_many :metcons, through: :workout_metcons
  has_many :workout_metcon_scores, through: :workout_metcons
  accepts_nested_attributes_for :metcons

  def metcons_attributes=(metcons_attributes)
    metcons_attributes.values.each do |attributes|
      #make sure metcon only built if form filled in for section (since multiple are optional)
      if !attributes[:title].blank?
        #check if metcon already exists by title
        metcon = Metcon.find_by(title: attributes[:title])
        if metcon 
          self.metcons << metcon
        else 
          self.metcons.build(attributes)
          self.save
        end
      end
    end
  end

  def date_pretty
    self.date.strftime("%B %-d, %Y")
  end
end
