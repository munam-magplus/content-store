class CreateLibraryUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :library_users do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :user_name
      t.string :password
      t.string :country_code
      t.string :status
      t.string :password_digest
      t.integer :institution_account_id

      t.timestamps
    end
  end
end
