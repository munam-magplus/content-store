class CreateRetailers < ActiveRecord::Migration[5.0]
  def change
    create_table :retailers do |t|
      t.string :retailer_code
      t.string :retailer_name
      t.string :publisher_id
      t.string :low_ip
      t.string :high_ip
      t.string :ip_list
      t.string :operation

      t.timestamps
    end
  end
end
