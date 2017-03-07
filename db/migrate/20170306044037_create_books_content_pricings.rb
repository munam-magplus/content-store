class CreateBooksContentPricings < ActiveRecord::Migration[5.0]
  def change
    create_table :books_content_pricings do |t|
      t.string :format
      t.string :ISBN
      t.string :DOI
      t.string :weight
      t.string :watermark_DRM
      t.string :external_DRM

      t.timestamps
    end
  end
end
