class AddNumberOfPagesToBooksPrimaryContentInformations < ActiveRecord::Migration[5.0]
  def change
  	add_column :books_primary_content_informations, :number_of_pages, :integer
  	add_column :books_primary_content_informations, :book_price, "decimal(8,2)"

  end
end
