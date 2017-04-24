class RemoveInstitutionAccIdFromInstitutionAccBillingAddresses < ActiveRecord::Migration[5.0]
  def change
  	remove_column :institution_acc_billing_addresses, :institution_acc_id
  end
end
