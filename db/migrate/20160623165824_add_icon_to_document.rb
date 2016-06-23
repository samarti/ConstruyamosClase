class AddIconToDocument < ActiveRecord::Migration
  def change
    add_column :documents, :icon, :string
  end
end
