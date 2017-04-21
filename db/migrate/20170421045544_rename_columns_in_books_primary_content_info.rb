class RenameColumnsInBooksPrimaryContentInfo < ActiveRecord::Migration[5.0]
  def change
  	rename_column :books_primary_content_infos, :publisher_date, :publication_date
  	rename_column :books_primary_content_infos, :publisher_month, :publication_month
  	rename_column :books_primary_content_infos, :publisher_year, :publication_year
  end
end
