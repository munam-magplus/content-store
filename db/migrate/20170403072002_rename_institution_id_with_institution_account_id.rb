class RenameInstitutionIdWithInstitutionAccountId < ActiveRecord::Migration[5.0]
  def change
  	rename_column :institution_acc_billing_addresses, :institution_id, :institution_account_id
  end
end
