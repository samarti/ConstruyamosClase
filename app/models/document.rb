class Document < ActiveRecord::Base
  has_and_belongs_to_many :levels
  has_many :ratings
  has_and_belongs_to_many :subjects
  belongs_to :teacher
  has_many :favorites
  has_many :liking_teacher, through: :favorites, source: :teachers
  acts_as_taggable_on :doc_tags
  before_save :stablish_file_icon
  #serialize :tags, JSON

  ICONS = {
    "pdf": "pdf-o",
    "doc": "word-o",
    "docx": "word-o",
    "ppt": "powerpoint-o",
    "pptx": "powerpoint-o",
    "mp4": "video-o",
    "mov": "video-o",
    "m4v": "video-o",
    "mkv": "video-o",
    "avi": "video-o",
    "wav": "audio-o",
    "mp3": "audio-o",
    "jpg": "image-o",
    "jpeg": "image-o",
    "png": "image-o",
    "java": "code-o",
    "rb": "code-o",
    "html": "code-o",
    "css": "code-o",
    "py": "code-o",
    "c": "code-o",
    "zip": "archive-o",
    "7zip": "archive-o",
    "rar": "archive-o",
    "txt": "text-o",
    "rt": "text-o"
  }

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

  def stablish_file_icon
    file_extension = self.url.split('.').last
    if ICONS.key?(file_extension.to_sym)
      self.icon = "fa-file-" + ICONS[file_extension.to_sym]
    else
      self.icon = "fa-file-o"
    end
  end
end
