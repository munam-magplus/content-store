class CreateArticles < ActiveRecord::Migration[5.0]
  def change
    create_table :articles do |t|
      t.string :publisher
      t.string :date_of_issue
      t.string :content_code
      t.string :journal_title
      t.string :article_type
      t.string :issue_type
      t.string :volume_number
      t.string :volume_title
      t.string :issue_number
      t.string :issue_supplement
      t.string :issue_number_begin
      t.string :issue_number_end
      t.string :access_level
      t.string :article_language
      t.string :external_drm
      t.string :article_sequence_number
      t.string :publisher_date
      t.string :issue_cover_date
      t.string :stock_number
      t.string :abstract

      t.timestamps
    end
  end
end
