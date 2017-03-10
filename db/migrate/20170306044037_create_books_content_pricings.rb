class CreateBooksContentPricings < ActiveRecord::Migration[5.0]
  def change
    create_table :books_content_pricings do |t|
      t.string :format
      t.string :isbn
      t.string :doi
      t.string :weight
      t.string :watermark_drm
      t.string :external_drm

      t.timestamps
    end
  end
end
