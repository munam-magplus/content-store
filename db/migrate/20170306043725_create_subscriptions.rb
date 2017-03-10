class CreateSubscriptions < ActiveRecord::Migration[5.0]
  def change
    create_table :subscriptions do |t|
      t.string :subscription_id
      t.string :subscription_name
      t.string :publisher
      t.string :subscription_description
      t.string :subscription_category
      t.string :subject_group_name
      t.string :subject_group_code
      t.string :subscription_type
      t.string :borrow_time
      t.string :number_of_books
      t.string :price
      t.string :currency
      t.string :discount_percentage

      t.timestamps
    end
  end
end
