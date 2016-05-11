class Teacher < ActiveRecord::Base
  has_many :ratings
  has_many :courses
  has_many :documents

  def full_name
    return self.first_name << " " << self.last_name
  end
end
