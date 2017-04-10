class CreateEndUser < ActiveRecord::Migration[5.0]
  def change
    create_table :end_users do |t|
      t.string :publisher
      t.string :email
      t.string :confirm_email
      t.string :password
      t.string :confirm_password
      t.string :first_name
      t.string :last_name
      t.string :country
    end
  end
end
