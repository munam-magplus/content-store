class AddPublisherIdToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :publisher_id, :string
    add_column :users, :integer, :string
  end
end
