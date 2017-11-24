class AddInstitutionAccountIdToIpAddresses < ActiveRecord::Migration[5.0]
  def change
  	add_column :ip_addresses, :institution_account_id, :integer
  end
end


