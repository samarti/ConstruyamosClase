class AddIconsToSubjects < ActiveRecord::Migration
  def change
    add_column :subjects, :icon, :string
  end
end
