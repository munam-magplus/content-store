class CreateArticleInformations < ActiveRecord::Migration[5.0]
  def change
    create_table :article_informations do |t|
      t.string :contributor_information_role
      t.string :contributor_information_name
      t.string :contributor_information_description
      t.string :content_format_type
      t.date :content_format_date_of_issue
      t.string :base_online_access_country
      t.string :base_online_access_currency
      t.float :base_online_access_price
      t.string :base_download_price_country
      t.string :base_download_price_currency
      t.float :base_download_price_price
      t.integer :article_id

      t.timestamps
    end
  end
end
