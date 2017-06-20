class CreateSubject < ActiveRecord::Migration[5.0]
  def change
    create_table :subjects do |t|
      t.string :subject_name
      t.integer :publisher_id
    end
  end
end
