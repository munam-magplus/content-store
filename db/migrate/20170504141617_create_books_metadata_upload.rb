class CreateBooksMetadataUpload < ActiveRecord::Migration[5.0]
  def change
    create_table :books_metadata_uploads do |t|
      t.string :attachment
    end
  end
end
