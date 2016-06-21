class CreateJoinTable < ActiveRecord::Migration
  def change
    create_join_table :teachers, :levels do |t|
      # t.index [:teacher_id, :level_id]
      # t.index [:level_id, :teacher_id]
    end
  end
end
