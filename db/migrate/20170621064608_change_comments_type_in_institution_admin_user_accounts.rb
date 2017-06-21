class ChangeCommentsTypeInInstitutionAdminUserAccounts < ActiveRecord::Migration[5.0]
  def change
    change_column :institution_admin_user_accounts, :comments, :text
  end
end
