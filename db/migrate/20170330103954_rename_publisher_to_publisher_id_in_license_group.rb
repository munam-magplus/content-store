class RenamePublisherToPublisherIdInlicenseGroup < ActiveRecord::Migration[5.0]
  def self.up
     rename_column :license_groups, :publisher, :publisher_id
  end
  def self.down
  end
end
