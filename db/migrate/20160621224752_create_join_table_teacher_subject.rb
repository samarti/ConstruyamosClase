class CreateJoinTableTeacherSubject < ActiveRecord::Migration
  def change
    create_join_table :teachers, :subjects do |t|
      # t.index [:teacher_id, :subject_id]
      # t.index [:subject_id, :teacher_id]
    end
  end
end
