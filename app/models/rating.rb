class Rating < ActiveRecord::Base
  belongs_to :teacher
  belongs_to :document
  before_save do
    document.update_attribute(:average_rating, document.getAverageStars)
  end

end
