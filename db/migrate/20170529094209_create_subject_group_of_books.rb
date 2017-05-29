class CreateSubjectGroupOfBooks < ActiveRecord::Migration[5.0]
  def change
    create_table :subject_group_of_books do |t|
      t.integer :book_id
      t.integer :subject_group_id

      t.timestamps
    end
  end
end
