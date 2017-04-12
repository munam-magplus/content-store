class AddInstitutionAccountIdToInstitutionAccBillingAddress < ActiveRecord::Migration[5.0]
  def change
    add_column :institution_acc_billing_addresses, :institution_account_id, :integer
  end
end
