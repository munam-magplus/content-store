class AddInstitutionAdminUserAccIdToInstitutionAccount < ActiveRecord::Migration[5.0]
  def change
    add_column :institution_accounts, :institution_admin_user_acc_id, :integer
  end
end
