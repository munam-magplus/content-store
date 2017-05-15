class CreateSubscriptions < ActiveRecord::Migration[5.0]
  def change
    create_table :subscriptions do |t|
      t.string :subscription_id
      t.string :subscription_name
      t.integer :publisher_id
      t.string :subscription_description
      t.string :subscription_category
      t.string :subject_group_name
      t.string :subject_group_code
      t.string :subscription_type
      t.string :borrow_time
      t.integer :number_of_books
      t.float :subscription_price
      t.string :currency
      t.integer :discount_percentage
      t.integer :subscription_duration

      t.timestamps
    end
  end
end
