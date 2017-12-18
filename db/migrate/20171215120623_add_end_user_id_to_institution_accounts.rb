class AddEndUserIdToInstitutionAccounts < ActiveRecord::Migration[5.0]
  def change
    add_column :institution_accounts, :end_user_id, :integer
  end
end
