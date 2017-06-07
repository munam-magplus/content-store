class AddColumnToBooksContributors < ActiveRecord::Migration[5.0]
  def change
	add_column :books_contributors, :books_primary_content_information_id, :integer
  end
end
