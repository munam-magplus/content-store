class RenameIsbnToFormatIsbn < ActiveRecord::Migration[5.0]
  def change
  	rename_column :books_content_pricings, :isbn, :format_isbn
  	change_column :books_content_pricings, :format_isbn, :bigint
  end
end
