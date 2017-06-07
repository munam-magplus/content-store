class AddColumnToBooksContentAccessRules < ActiveRecord::Migration[5.0]
  def change
	add_column :books_content_access_rules, :books_primary_content_information_id, :integer
  end
end
