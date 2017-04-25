class RenamePublisherToPublisherIdInInstitutionAccounts < ActiveRecord::Migration[5.0]
  def change
  	rename_column :institution_accounts, :publisher, :publisher_id
  end
end
