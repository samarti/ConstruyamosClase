class Teacher < ActiveRecord::Base
  before_save {email.downcase!}
  validates :first_name, presence: true, length: {maximum: 50}
  validates :last_name, presence:true , length: {maximum: 50}
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
  validates :email, presence:   true,
  format:     { with: VALID_EMAIL_REGEX },
  uniqueness: { case_sensitive: false }
  has_secure_password
  validates :password, presence: true, length: { minimum: 6 }

  has_many :ratings
  has_many :courses
  has_many :documents

  def full_name
    return self.first_name + " " + self.last_name
  end

  def get_rating
    average_rating = 0
    total_documents = self.documents.count
    if total_documents > 0
      self.documents.each { |doc|
        average_rating += doc.average_rating
      }
      return average_rating/total_documents
    else
      return "N/A"
    end
  end
end
