class CreateBooksPrimaryContentInfos < ActiveRecord::Migration[5.0]
  def change
    create_table :books_primary_content_infos do |t|
      t.string :content_code
      t.string :publisher
      t.string :title
      t.string :sub_title
      t.string :ISBN
      t.string :lang
      t.string :content_classification
      t.string :file_name
      t.string :stock_number
      t.string :pub_site_sales_link
      t.string :blurb
      t.string :pub_date
      t.string :pub_month
      t.integer :pub_yesr
      t.string :conversion_req
      t.string :edition
      t.string :binding
      t.string :volume
      t.string :series_ISBN
      t.string :series_title

      t.timestamps
    end
  end
end
