class RemovePublicationDateFromBooksPrimaryContentInformations < ActiveRecord::Migration[5.0]
  def change
  	remove_column :books_primary_content_informations, :publication_date
  end
end
