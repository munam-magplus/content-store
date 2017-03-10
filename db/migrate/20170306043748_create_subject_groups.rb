class CreateSubjectGroups < ActiveRecord::Migration[5.0]
  def change
    create_table :subject_groups do |t|
      t.string :publisher
      t.string :subject_group_level
      t.string :subject_group_code
      t.string :subject_group_name
      t.string :guest_user_view_limit
      t.string :authentication_user_view_limit
      t.string :discount_percentage
      t.string :viewability_percentage
      t.string :select_language
      t.string :description

      t.timestamps
    end
  end
end
