class AddColumnsToPublishers < ActiveRecord::Migration[5.0]
  def change
   	add_column :publishers, :about, :string
   	add_column :publishers, :policy, :string
   	add_column :publishers, :terms_and_conditions, :string
  end
end
