class CreateIsbnchapterdetails < ActiveRecord::Migration[5.0]
  def change
    create_table :isbnchapterdetails do |t|
      t.bigint :isbn
      t.integer :no_of_chapters
      t.string :file_name
      t.timestamps
    end
  end
end
