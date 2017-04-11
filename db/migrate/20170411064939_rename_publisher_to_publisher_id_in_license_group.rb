class RenamePublisherToPublisherIdInLicenseGroup < ActiveRecord::Migration[5.0]
  def change
  	rename_column :license_groups, :publisher, :publisher_id
  end
end
