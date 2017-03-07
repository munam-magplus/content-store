class CreateArticles < ActiveRecord::Migration[5.0]
  def change
    create_table :articles do |t|
      t.string :publisher
      t.string :DOI
      t.string :content_code
      t.string :jou_title
      t.string :article_type
      t.string :issue_type
      t.string :vol_no
      t.string :vol_title
      t.string :issue_no
      t.string :issue_supplement
      t.string :issue_number_begin
      t.string :issue_number_end
      t.string :access_level
      t.string :article_lang
      t.string :external_DRM
      t.string :article_sequence_number
      t.string :pub_date
      t.string :issue_cover_date
      t.string :stock_number
      t.string :abstract

      t.timestamps
    end
  end
end
