class Document < ActiveRecord::Base
  has_and_belongs_to_many :levels
  has_many :ratings
  has_and_belongs_to_many :subjects
  belongs_to :teacher

  def getStars
    sum = 0;
    n = self.ratings.count
    self.ratings.each { |r|
      sum += r.grade;
    }
    return (sum.to_f/n).round(1)
  end
end
