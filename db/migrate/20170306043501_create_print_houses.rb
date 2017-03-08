class CreatePrintHouses < ActiveRecord::Migration[5.0]
  def change
    create_table :print_houses do |t|
      t.string :pub
      t.string :print_house_code
      t.string :print_house_name
      t.string :ranking
      t.string :VAT_reg_no
      t.string :contact_first_name
      t.string :contact_last_name
      t.string :phone
      t.string :email
      t.string :address_line1
      t.string :address_line2
      t.string :city
      t.string :state
      t.string :postal_code
      t.string :country
      t.string :shipping_type
      t.string :shipping_countries

      t.timestamps
    end
  end
end
