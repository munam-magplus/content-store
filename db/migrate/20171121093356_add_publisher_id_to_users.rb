class AddPublisherIdToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :publisher_id, :integer
  end
end
