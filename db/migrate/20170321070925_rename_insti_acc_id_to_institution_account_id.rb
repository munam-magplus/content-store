class RenameInstiAccIdToInstitutionAccountId < ActiveRecord::Migration[5.0]
  def change
	rename_column :institution_acc_billing_addresses, :insti_acc_id, :institution_acc_id
  end
end
