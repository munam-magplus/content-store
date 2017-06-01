class AddAttachmentPublisherLogoToPublishers < ActiveRecord::Migration
  def self.up
    change_table :publishers do |t|
      t.attachment :publisher_logo
    end
  end

  def self.down
    remove_attachment :publishers, :publisher_logo
  end
end
