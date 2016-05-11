class Document < ActiveRecord::Base
  has_and_belongs_to_many :levels
  has_many :ratings
  has_and_belongs_to_many :subjects
  belongs_to :teacher
  serialize :tags, JSON
end
