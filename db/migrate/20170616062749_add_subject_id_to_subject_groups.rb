class AddSubjectIdToSubjectGroups < ActiveRecord::Migration[5.0]
  def change
    add_column :subject_groups, :subject_id, :integer
  end
end
