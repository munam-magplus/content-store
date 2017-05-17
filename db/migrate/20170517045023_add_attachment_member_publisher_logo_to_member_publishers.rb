class AddAttachmentMemberPublisherLogoToMemberPublishers < ActiveRecord::Migration
  def self.up
    change_table :member_publishers do |t|
      t.attachment :member_publisher_logo
    end
  end

  def self.down
    remove_attachment :member_publishers, :member_publisher_logo
  end
end
