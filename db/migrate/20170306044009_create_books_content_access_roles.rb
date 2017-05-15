class CreateBooksContentAccessRoles < ActiveRecord::Migration[5.0]
  def change
    create_table :books_content_access_roles do |t|
      t.string :territorial_list_type
      t.string :territorial_list
      t.integer :landing_page
      t.integer :viewability_percentage
      t.integer :exclude_pages_from_display
      t.integer :total_free_pages_before_purchase
      t.integer :total_free_page_before_login
      t.integer :exclude_pages_from_external_index
      t.integer :actual_pages_indexable
      t.integer :actual_browsable_pages
      t.integer :actual_printable_pages
      t.integer :actual_allowed_copying_pages
      t.string :internal_related_content
      t.string :related_content_identifier
      t.string :related_content_name
      t.string :related_content_url
      t.string :subject_group
      t.string :number_of_page
      t.string :free_matter
      t.integer :first_page_of_full_text
      t.integer :last_page_of_full_text

      t.timestamps
    end
  end
end
