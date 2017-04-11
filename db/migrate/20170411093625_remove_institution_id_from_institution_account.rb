class RemoveInstitutionIdFromInstitutionAccount < ActiveRecord::Migration[5.0]
  def change
  	remove_column :institution_accounts, :institution_id
  end
end
