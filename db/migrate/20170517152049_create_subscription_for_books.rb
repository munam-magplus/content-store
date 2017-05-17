class CreateSubscriptionForBooks < ActiveRecord::Migration[5.0]
  def change
    create_table :subscription_for_books do |t|
      t.integer :subscription_id
      t.integer :publisher_id
      t.integer :title_id
      t.boolean :all_publisher
      t.boolean :all_title
    end
  end
end
