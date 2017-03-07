class CreateRetailers < ActiveRecord::Migration[5.0]
  def change
    create_table :retailers do |t|
      t.string :ret_code
      t.string :ret_name
      t.string :pub_id
      t.string :low_IP
      t.string :high_IP
      t.string :IP_list
      t.string :operation

      t.timestamps
    end
  end
end
