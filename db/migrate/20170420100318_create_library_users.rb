class CreateLibraryUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :library_users do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :user_name
      t.string :password
      t.string :confirm_password
      t.string :country
      t.string :status

      t.timestamps
    end
  end
end
