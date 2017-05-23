class AddInstitutionAccountIdToInstitutionAdminUserAccounts < ActiveRecord::Migration[5.0]
  def change
    add_column :institution_admin_user_accounts, :institution_account_id, :integer
  end
end
