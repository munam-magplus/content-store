class ChangeSubjectGroupDescriptionTypeInSubjectGroup < ActiveRecord::Migration[5.0]
  def change
  	change_column :subject_groups, :subject_group_description, :text
  end
end
