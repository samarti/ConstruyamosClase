class AddDocumentsToTeacher < ActiveRecord::Migration
  def change
    add_reference :teachers, :document, index: true, foreign_key: true
  end
end
