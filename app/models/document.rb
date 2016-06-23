class Document < ActiveRecord::Base
  has_and_belongs_to_many :levels
  has_many :ratings
  has_and_belongs_to_many :subjects
  belongs_to :teacher
  acts_as_taggable_on :doc_tags
  #serialize :tags, JSON

  def getAverageStars
    sum = 0;
    n = self.ratings.count
    self.ratings.each { |r|
      sum += r.grade;
    }
    return (sum.to_f/n).round(1)
  end

  def self.getRanking
    return Document.order(:average_rating)
  end

  def ratings_by_date
    return self.ratings.order(created_at: :desc)
  end
end
