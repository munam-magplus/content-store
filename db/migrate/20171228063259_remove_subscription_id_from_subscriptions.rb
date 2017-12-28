class RemoveSubscriptionIdFromSubscriptions < ActiveRecord::Migration[5.0]
  def change
    remove_column :subscriptions, :subscription_id, :string
    remove_column :subscriptions, :subscription_category, :string
    remove_column :subscriptions, :subscription_type, :string
    remove_column :subscriptions, :agreement_form, :date
    remove_column :subscriptions, :agreement_to, :date
    remove_column :subscriptions, :available_for_institutional_account, :string
  end
end
