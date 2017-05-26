class AddThemeNameToPublisher < ActiveRecord::Migration[5.0]
  def change
    add_column :publishers, :theme_name, :string
  end
end
