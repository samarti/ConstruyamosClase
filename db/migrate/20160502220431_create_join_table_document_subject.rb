class CreateJoinTableDocumentSubject < ActiveRecord::Migration
  def change
    create_join_table :documents, :subjects do |t|
      # t.index [:document_id, :subject_id]
      # t.index [:subject_id, :document_id]
    end
  end
end
