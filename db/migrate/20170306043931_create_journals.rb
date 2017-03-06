class CreateJournals < ActiveRecord::Migration[5.0]
  def change
    create_table :journals do |t|
      t.string :jou_code
      t.string :publisher
      t.string :jou_title
      t.string :jou_subtitle
      t.string :jou_prim_ISSN
      t.string :jou_electronic_ISSN
      t.string :jou_owner
      t.string :lang
      t.string :jou_content_classification
      t.string :jou_distribution
      t.string :price_in
      t.string :journal_publisher_date
      t.string :stock_no
      t.string :cover_image
      t.string :jou_categories
      t.string :jou_desc
      t.string :editorial
      t.string :instructions_for_authors

      t.timestamps
    end
  end
end
