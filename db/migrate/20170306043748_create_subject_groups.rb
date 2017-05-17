class CreateSubjectGroups < ActiveRecord::Migration[5.0]
  def change
    create_table :subject_groups do |t|
      t.integer :publisher_id
      t.integer :subject_group_level
      t.string :subject_group_code
      t.string :subject_group_name
      t.integer :guest_user_view_limit
      t.integer :authentication_user_view_limit
      t.float :discount_percentage
      t.float :viewability_percentage
      t.string :language
      t.string :subject_group_description

      t.timestamps
    end
  end
end
