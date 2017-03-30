class RenamePublisherToPublisherIdInCampaign < ActiveRecord::Migration[5.0]
  def self.up
     rename_column :campaigns, :publisher, :publisher_id
  end
  def self.down
  end
end