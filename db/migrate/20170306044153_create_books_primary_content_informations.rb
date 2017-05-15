class CreateBooksPrimaryContentInformations < ActiveRecord::Migration[5.0]
  def change
    create_table :books_primary_content_informations do |t|
      t.string :content_code
      t.integer :publisher_id
      t.string :book_title
      t.string :subject_title
      t.integer :isbn
      t.string :language
      t.string :content_classification
      t.string :file_name
      t.integer :stock_number
      t.string :publisher_site_sales_link
      t.string :book_blurb
      t.integer :publication_date
      t.string :publication_month
      t.integer :publication_year
      t.string :conversion_required
      t.string :edition
      t.string :binding
      t.integer :volume
      t.integer :series_isbn
      t.string :series_title
      t.string :dimension
      t.integer :license_id

      t.timestamps
    end
  end
end
