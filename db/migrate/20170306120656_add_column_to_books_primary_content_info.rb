class AddColumnToBooksPrimaryContentInfo < ActiveRecord::Migration[5.0]
  def change
    add_column :books_primary_content_infos, :dimension, :string
  end
end
