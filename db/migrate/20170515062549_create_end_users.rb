class CreateEndUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :end_users do |t|
      t.integer :publisher_id
      t.string :email
      t.string :password
      t.string :first_name
      t.string :last_name
      t.string :country_code

      t.timestamps
    end
  end
end
