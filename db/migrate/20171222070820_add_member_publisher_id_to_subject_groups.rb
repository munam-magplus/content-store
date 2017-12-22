class AddMemberPublisherIdToSubjectGroups < ActiveRecord::Migration[5.0]
  def change
    add_column :subject_groups, :member_publisher_id, :integer
  end
end
