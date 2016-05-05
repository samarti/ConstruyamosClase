class CreateJoinTableDocumentLevel < ActiveRecord::Migration
  def change
    create_join_table :documents, :levels do |t|
      # t.index [:document_id, :level_id]
      # t.index [:level_id, :document_id]
    end
  end
end
