class CreateSubscriptions < ActiveRecord::Migration[5.0]
  def change
    create_table :subscriptions do |t|
      t.string :subscription_id
      t.string :subscription_name
      t.integer :publisher_id
      t.string :subscription_description
      t.string :subscription_category
      t.string :subscription_type
      t.date :agreement_form
      t.date :agreement_to
      t.string :available_for_institutional_account
      t.integer :purchase_information_number_of_books
      t.float :purchase_information_price
      t.float :purchase_information_discount_percentage

      t.timestamps
    end
  end
end
