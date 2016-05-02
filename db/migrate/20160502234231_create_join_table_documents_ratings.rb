class CreateJoinTableDocumentsRatings < ActiveRecord::Migration
  def change
    create_join_table :documents, :ratings do |t|
      # t.index [:document_id, :rating_id]
      # t.index [:rating_id, :document_id]
    end
  end
end
