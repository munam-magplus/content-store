class AddInstitutionAccountIdToEndUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :end_users, :institution_account_id, :integer
  end
end
