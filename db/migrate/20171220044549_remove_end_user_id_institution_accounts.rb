class RemoveEndUserIdInstitutionAccounts < ActiveRecord::Migration[5.0]
  def change
  	remove_column :institution_accounts, :end_user_id
  end
end
