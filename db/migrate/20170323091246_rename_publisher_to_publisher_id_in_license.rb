class RenamePublisherToPublisherIdInLicense < ActiveRecord::Migration[5.0]
  def self.up
     rename_column :licenses, :publisher, :publisher_id
  end
  def self.down
  end
end
