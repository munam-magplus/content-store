class AddSubscriptionIdToSubscriptionInstitute < ActiveRecord::Migration[5.0]
  def change
    add_column :subscription_institutes, :subscription_id, :integer
  end
end
