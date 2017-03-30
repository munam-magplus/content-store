class ArticleInfo < ActiveRecord::Migration[5.0]
  def change
  	 create_table :article_infos do |t|
      t.string :contributor_info_role
      t.string :contributor_info_name
      t.string :contributor_info_description
      t.string :content_format_format
      t.string :content_format_doi
      t.string :base_online_access_country
      t.string :base_online_access_currency
      t.string :base_online_access_price
      t.string :base_download_price_country
      t.string :base_download_price_currency
      t.string :base_download_price_price
      t.integer :article_id
      
      t.timestamps
    end
  end
end
