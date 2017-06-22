class ChangeBlurbTypeInBooksPrimaryContentInformations < ActiveRecord::Migration[5.0]
  def change
  	change_column :books_primary_content_informations, :book_blurb, :text
    change_column :books_primary_content_informations, :isbn, :bigint
    change_column :books_primary_content_informations, :series_isbn, :bigint
  end
end
