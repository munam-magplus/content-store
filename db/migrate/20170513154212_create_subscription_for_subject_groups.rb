class CreateSubscriptionForSubjectGroups < ActiveRecord::Migration[5.0]
  def change
    create_table :subscription_for_subject_groups do |t|
      t.integer :subscription_id
      t.integer :subject_group_id

      t.timestamps
    end
  end
end
