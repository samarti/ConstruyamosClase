class AddCoursesToTeacher < ActiveRecord::Migration
  def change
    add_reference :teachers, :course, index: true, foreign_key: true
  end
end
