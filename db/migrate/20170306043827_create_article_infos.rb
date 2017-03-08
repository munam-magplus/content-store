class CreateArticleInfos < ActiveRecord::Migration[5.0]
  def change
    create_table :article_infos do |t|
      t.string :role
      t.string :name
      t.string :desc
      t.string :format
      t.string :DOI
      t.string :BOA_country
      t.string :BOA_currency
      t.string :BOA_price
      t.string :BDP_country
      t.string :BDP_currency
      t.string :BDP_price

      t.timestamps
    end
  end
end
