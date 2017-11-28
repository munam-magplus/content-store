class AddSubjectGroupIdToSubscriptionBooks < ActiveRecord::Migration[5.0]
  def change
    add_column :subscription_books, :subject_group_id, :integer
  end
end
