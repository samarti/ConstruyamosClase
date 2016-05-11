class AddTeacherRefToRatings < ActiveRecord::Migration
  def change
    add_reference :ratings, :teacher, index: true, foreign_key: true
  end
end
