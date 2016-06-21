class Favorite < ActiveRecord::Base
  belongs_to :document
  belongs_to :teacher
end
