class Rating < ActiveRecord::Base
  belongs_to :teacher
  belongs_to :document
  before_save do
    if document
      document.update_attribute(:average_rating, document.getAverageStars)
    end
  end

end
