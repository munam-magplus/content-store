class ChangeTypeOfAboutInPublishers < ActiveRecord::Migration[5.0]
  def up
    change_column :publishers, :about, :text
    change_column :publishers, :policy, :text
    change_column :publishers, :terms_and_conditions, :text
  end

  def down
    change_column :publishers, :about, :string
    change_column :policy, :about, :string
    change_column :policy, :terms_and_conditions, :string
  end
end
