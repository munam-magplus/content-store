class CreateSubscriptions < ActiveRecord::Migration[5.0]
  def change
    create_table :subscriptions do |t|
      t.string :subscription_ID
      t.string :subscription_name
      t.string :pub
      t.string :subscription_desc
      t.string :subscription_category
      t.string :sub_group_name
      t.string :sub_group_code
      t.string :subscription_type
      t.string :borrow_time
      t.string :no_of_books
      t.string :price
      t.string :currency
      t.string :discount_percentage

      t.timestamps
    end
  end
end
