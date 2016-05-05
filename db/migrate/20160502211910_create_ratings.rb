class CreateRatings < ActiveRecord::Migration
  def change
    create_table :ratings do |t|
      t.integer :grade
      t.text :comment

      t.timestamps null: false
    end
  end
end
