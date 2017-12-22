class AddMemberPublisherIdToBooksPrimaryContentInformation < ActiveRecord::Migration[5.0]
  def change
    add_column :books_primary_content_informations, :member_publisher_id, :integer
  end
end
