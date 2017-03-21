class CreateInstitutionAdminUserAccs < ActiveRecord::Migration[5.0]
  def change
    create_table :institution_admin_user_accs do |t|
      t.string :role
      t.string :publisher
      t.string :institution_name
      t.string :user_name
      t.string :status
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :phone
      t.string :position
      t.string :fax
      t.string :password
      t.string :confirm_password
      t.string :comments

      t.timestamps
    end
  end
end