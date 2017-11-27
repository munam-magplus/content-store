class AddInstitutionAccountIdToSubscriptionInstitute < ActiveRecord::Migration[5.0]
  def change
    add_column :subscription_institutes, :institution_account_id, :integer
  end
end
