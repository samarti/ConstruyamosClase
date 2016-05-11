class AddAverageRatingToDocument < ActiveRecord::Migration
  def change
    add_column :documents, :average_rating, :float
  end
end
