class Teacher < ActiveRecord::Base
  before_save {email.downcase!}
  validates :first_name, presence: true, length: {maximum: 50}
  validates :last_name, presence:true , length: {maximum: 50}
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
  validates :email, presence:   true,
  format:     { with: VALID_EMAIL_REGEX },
  uniqueness: { case_sensitive: false }
  has_secure_password
  validates :password, presence: true, length: { minimum: 6 }, on: :create
  validates :password, length: {minimum: 6}, on: :update, allow_blank: true


  has_many :ratings
  has_many :courses
  has_many :documents
  
  has_many :favorites
  has_many :favorite_documents, through: :favorites, source: :document

  has_and_belongs_to_many :levels
  has_and_belongs_to_many :subjects

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
