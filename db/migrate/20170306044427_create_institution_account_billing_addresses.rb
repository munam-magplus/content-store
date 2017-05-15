class CreateInstitutionAccountBillingAddresses < ActiveRecord::Migration[5.0]
  def change
    create_table :institution_account_billing_addresses do |t|
      t.string :first_name
      t.string :last_name
      t.integer :phone
      t.string :email
      t.string :address
      t.string :address_line2
      t.string :address_line3
      t.string :city
      t.string :state
      t.integer :postal_code
      t.string :country_code
      t.string :comments
      t.integer :institution_account_id

      t.timestamps
    end
  end
end
