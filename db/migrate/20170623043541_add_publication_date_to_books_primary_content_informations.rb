class AddPublicationDateToBooksPrimaryContentInformations < ActiveRecord::Migration[5.0]
  def change
  	add_column :books_primary_content_informations, :publication_date, :date 
  end
end
