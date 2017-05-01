class RemoveInstitutionAdminUserFromInstitutionAccounts < ActiveRecord::Migration[5.0]
  def change
  	remove_column :institution_accounts , :institution_admin_user_acc_id
	remove_column :institution_accounts , :logo

  end
end
