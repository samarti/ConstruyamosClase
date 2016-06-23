class AddColumnToFavorite < ActiveRecord::Migration
  def change
    add_column :favorites, :teacher_id, :integer
    add_column :favorites, :document_id, :integer

  end
end
