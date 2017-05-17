class CreateInstitutionAdminUserAccounts < ActiveRecord::Migration[5.0]
  def change
    create_table :institution_admin_user_accounts do |t|
      t.string :role
      t.integer :publisher_id
      t.string :institution_name
      t.string :user_name
      t.string :status
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :phone
      t.string :position
      t.integer :fax
      t.string :password
      t.string :comments
      t.integer :primary_count

      t.timestamps
    end
  end
end
