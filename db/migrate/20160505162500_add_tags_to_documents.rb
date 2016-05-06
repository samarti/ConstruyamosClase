class AddTagsToDocuments < ActiveRecord::Migration
  def change
    add_column :documents, :tags, :json
  end
end
