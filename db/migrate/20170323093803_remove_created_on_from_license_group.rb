class RemoveCreatedOnFromLicenseGroup < ActiveRecord::Migration[5.0]
  def change
    remove_column :license_groups, :created_on, :date
  end
end
