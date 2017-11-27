class AddSubscriptionIdToSubscriptionBooks < ActiveRecord::Migration[5.0]
  def change
    add_column :subscription_books, :subscription_id, :integer
  end
end
