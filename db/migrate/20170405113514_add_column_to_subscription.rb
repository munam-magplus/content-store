class AddColumnToSubscription < ActiveRecord::Migration[5.0]
  def change
    add_column :subscriptions, :duration, :integer
  end
end
