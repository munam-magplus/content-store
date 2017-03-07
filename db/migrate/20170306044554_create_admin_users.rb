class CreateAdminUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :admin_users do |t|
      t.string :publisher
      t.string :email
      t.string :confirm_email
      t.string :first_name
      t.string :last_name
      t.string :country
      t.string :lang
      t.string :user_type
      t.string :role
      t.string :publishers

      t.timestamps
    end
  end
end
