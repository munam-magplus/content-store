class AddColumnToBooksContentPricings < ActiveRecord::Migration[5.0]
  def change
	add_column :books_content_pricings, :books_primary_content_information_id, :integer
  end
end
