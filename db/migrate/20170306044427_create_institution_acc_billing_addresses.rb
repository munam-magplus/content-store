class CreateInstitutionAccBillingAddresses < ActiveRecord::Migration[5.0]
  def change
    create_table :institution_acc_billing_addresses do |t|
      t.string :first_name
      t.string :last_name
      t.string :phone
      t.string :email
      t.string :address
      t.string :add_line2
      t.string :add_line3
      t.string :city
      t.string :state
      t.integer :postal_code
      t.string :country
      t.string :comments

      t.timestamps
    end
  end
end
