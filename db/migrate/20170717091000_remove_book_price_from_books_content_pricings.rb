class RemoveBookPriceFromBooksContentPricings < ActiveRecord::Migration[5.0]
  def change
  	remove_column :books_content_pricings, :book_price
  end
end
