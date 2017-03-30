class RenamePublisherToPublisherIdInPromoCodes < ActiveRecord::Migration[5.0]
  def self.up
     rename_column :promo_codes, :publisher, :publisher_id
     rename_column :promo_codes, :campaign, :campaign_id
  end
  def self.down
  end
end
