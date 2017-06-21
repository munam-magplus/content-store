class AddColumnToBookContentPricings < ActiveRecord::Migration[5.0]
  def change
  	add_column :books_content_pricings, :book_price, "decimal(8,2)"
  end
end
