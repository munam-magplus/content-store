class RenamePublisherToPublisherIdInInstitutionAdminUserAccs < ActiveRecord::Migration[5.0]
  def change
  	rename_column :institution_admin_user_accs, :publisher, :publisher_id
  end
end
