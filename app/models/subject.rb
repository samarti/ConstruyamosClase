class Subject < ActiveRecord::Base
  has_and_belongs_to_many :documents
  has_and_belongs_to_many :teachers

  def self.get_documents(id)
      @documents = Subject.where("id = #{id}").first.documents
  end
end
