class AddTeacherRefToDocuments < ActiveRecord::Migration
  def change
    add_reference :documents, :teacher, index: true, foreign_key: true
  end
end
