class CreateAdminUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :admin_users do |t|
      t.integer :publisher_id
      t.string :email
      t.string :first_name
      t.string :last_name
      t.string :country_code
      t.string :language
      t.string :user_type
      t.string :password

      t.timestamps
    end
  end
end
