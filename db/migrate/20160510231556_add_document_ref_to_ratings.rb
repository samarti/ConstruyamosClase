class AddDocumentRefToRatings < ActiveRecord::Migration
  def change
    add_reference :ratings, :document, index: true, foreign_key: true
  end
end
