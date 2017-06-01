class RenameBookIdToBooksPrimaryContentInformationId < ActiveRecord::Migration[5.0]
  def change
    rename_column :subject_group_books, :book_id, :books_primary_content_information_id
  end
end
