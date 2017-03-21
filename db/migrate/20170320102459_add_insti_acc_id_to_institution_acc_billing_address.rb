class AddInstiAccIdToInstitutionAccBillingAddress < ActiveRecord::Migration[5.0]
  def change
    add_column :institution_acc_billing_addresses, :insti_acc_id, :integer
  end
end
