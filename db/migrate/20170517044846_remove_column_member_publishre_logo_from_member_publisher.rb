class RemoveColumnMemberPublishreLogoFromMemberPublisher < ActiveRecord::Migration[5.0]
  def change
  	remove_column :member_publishers, :member_publisher_logo
  end
end
