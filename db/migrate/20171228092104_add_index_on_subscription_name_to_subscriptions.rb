class AddIndexOnSubscriptionNameToSubscriptions < ActiveRecord::Migration[5.0]
  def change
  	add_index :subscriptions, [:id, :subscription_name], unique: true
  end
end
