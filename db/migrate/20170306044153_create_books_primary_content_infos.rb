class CreateBooksPrimaryContentInfos < ActiveRecord::Migration[5.0]
  def change
    create_table :books_primary_content_infos do |t|
      t.string :content_code
      t.string :publisher
      t.string :title
      t.string :subject_title
      t.string :isbn
      t.string :language
      t.string :content_classification
      t.string :file_name
      t.string :stock_number
      t.string :publisher_site_sales_link
      t.string :blurb
      t.string :publisher_date
      t.string :publisher_month
      t.integer :publisher_year
      t.string :conversion_required
      t.string :edition
      t.string :binding
      t.string :volume
      t.string :series_ISBN
      t.string :series_title
      t.string :dimension

      t.timestamps
    end
  end
end
