class CreateSubjectGroups < ActiveRecord::Migration[5.0]
  def change
    create_table :subject_groups do |t|
      t.string :pub
      t.string :sub_group_level
      t.string :sub_group_code
      t.string :sub_group_name
      t.string :guest_user_view_limit
      t.string :auth_user_view_limit
      t.string :discount_percentage
      t.string :viewability_percentage
      t.string :select_lang
      t.string :desc

      t.timestamps
    end
  end
end
