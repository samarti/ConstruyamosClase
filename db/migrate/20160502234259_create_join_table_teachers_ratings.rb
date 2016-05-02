class CreateJoinTableTeachersRatings < ActiveRecord::Migration
  def change
    create_join_table :teachers, :ratings do |t|
      # t.index [:teacher_id, :rating_id]
      # t.index [:rating_id, :teacher_id]
    end
  end
end
