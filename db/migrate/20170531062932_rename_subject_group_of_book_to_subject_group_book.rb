class RenameSubjectGroupOfBookToSubjectGroupBook < ActiveRecord::Migration[5.0]
  def change
    rename_table :subject_group_of_books, :subject_group_books
  end
end
