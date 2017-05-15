class CreateArticles < ActiveRecord::Migration[5.0]
  def change
    create_table :articles do |t|
      t.integer :publisher_id
      t.date :date_of_issue
      t.string :content_code
      t.string :journal_title
      t.string :article_type
      t.string :issue_type
      t.integer :volume_number
      t.string :volume_title
      t.integer :issue_number
      t.string :issue_supplement
      t.integer :issue_number_begin
      t.integer :issue_number_end
      t.string :access_level
      t.string :article_language
      t.string :external_drm
      t.integer :article_sequence_number
      t.date :publication_date
      t.date :issue_cover_date
      t.integer :stock_number
      t.string :article_abstract

      t.timestamps
    end
  end
end
