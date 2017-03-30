class AddPrimaryCountToInstitutionAdminUserAcc < ActiveRecord::Migration[5.0]
  def change
    add_column :institution_admin_user_accs, :primary_count, :integer
  end
end
