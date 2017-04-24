class AddLicenseGroupIdToLicense < ActiveRecord::Migration[5.0]
  def change
    add_column :licenses, :license_group_id, :integer
  end
end
