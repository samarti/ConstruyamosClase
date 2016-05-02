class Teacher < ActiveRecord::Base
  has_many :ratings
  has_many :courses
  has_many :documents
end
