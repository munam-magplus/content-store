class CreateBooksSeoConfigs < ActiveRecord::Migration[5.0]
  def change
    create_table :books_seo_configs do |t|
      t.string :territorial_list_type
      t.string :territorial_list
      t.string :landing_page
      t.string :viewability_percentage
      t.string :exclude_pages_from_display
      t.string :total_free_pages_before_purchase
      t.string :total_free_page_before_login
      t.string :exclude_pages_from_external_index
      t.string :actual_pages_indexable
      t.string :actual_browsable_pages
      t.string :actual_printable
      t.string :actual_allowed_copying_pages
      t.string :internal_related_content
      t.string :related_content_identifier
      t.string :related_content_name
      t.string :related_content_url
      t.string :subject_group
      t.string :no_of_page
      t.string :free_matter
      t.string :first_page_of_full_text
      t.string :last_page_of_full_text

      t.timestamps
    end
  end
end
