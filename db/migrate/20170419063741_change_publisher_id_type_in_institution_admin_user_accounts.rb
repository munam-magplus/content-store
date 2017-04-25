class ChangePublisherIdTypeInInstitutionAdminUserAccounts < ActiveRecord::Migration[5.0]
  def change
  	  	change_column :institution_admin_user_accs, :publisher_id, :integer
  end
end
