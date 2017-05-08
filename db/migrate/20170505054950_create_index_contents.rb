class CreateIndexContents < ActiveRecord::Migration[5.0]
  def change
    create_table :index_contents do |t|
      t.integer :content_code
      t.string :publisher_code

      t.timestamps
    end
  end
end
