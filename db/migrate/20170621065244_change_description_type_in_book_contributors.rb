class ChangeDescriptionTypeInBookContributors < ActiveRecord::Migration[5.0]
  def change
    change_column :books_contributors, :description, :text
    change_column :books_contributors, :website_description, :text
  end
end
