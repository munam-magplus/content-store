class ChangePublisherIdTypeInInstitutionAccounts < ActiveRecord::Migration[5.0]
  def change
  	change_column :institution_accounts, :publisher_id, :integer
  end
end
