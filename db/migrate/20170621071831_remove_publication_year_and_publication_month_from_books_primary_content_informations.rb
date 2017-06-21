class RemovePublicationYearAndPublicationMonthFromBooksPrimaryContentInformations < ActiveRecord::Migration[5.0]
  def change
  	remove_column :books_primary_content_informations, :publication_month
    remove_column :books_primary_content_informations, :publication_year
  end
end
