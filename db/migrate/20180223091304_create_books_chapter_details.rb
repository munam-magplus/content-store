class CreateBooksChapterDetails < ActiveRecord::Migration[5.0]
  def change
    create_table :books_chapter_details do |t|
      t.integer :books_primary_content_information_id
      t.integer :number_of_chapters

      t.timestamps
    end
  end
end
