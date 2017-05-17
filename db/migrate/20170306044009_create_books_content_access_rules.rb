class CreateBooksContentAccessRules < ActiveRecord::Migration[5.0]
  def change
    create_table :books_content_access_rules do |t|
      t.string :territorial_list_type
      t.string :territorial_list
      t.integer :landing_page
      t.float :viewability_percentage
      t.integer :exclude_pages_from_display
      t.integer :total_free_pages_before_purchase
      t.integer :total_free_page_before_login
      t.integer :exclude_pages_from_external_index
      t.integer :actual_pages_indexable
      t.integer :actual_browsable_pages
      t.integer :actual_printable_pages
      t.integer :actual_allowed_copying_pages
      t.string :internal_related_content

      t.timestamps
    end
  end
end
