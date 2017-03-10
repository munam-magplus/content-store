class CreateJournals < ActiveRecord::Migration[5.0]
  def change
    create_table :journals do |t|
      t.string :journal_code
      t.string :publisher
      t.string :journal_title
      t.string :journal_subtitle
      t.string :journal_primary_issn
      t.string :journal_electronic_issn
      t.string :journal_owner
      t.string :language
      t.string :journal_content_classification
      t.string :journal_distribution
      t.string :price_in
      t.string :journal_publisher_date
      t.string :stock_number
      t.string :cover_image
      t.string :journal_categories
      t.string :journal_description
      t.string :editorial
      t.string :instructions_for_authors

      t.timestamps
    end
  end
end
