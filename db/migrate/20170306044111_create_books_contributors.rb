class CreateBooksContributors < ActiveRecord::Migration[5.0]
  def change
    create_table :books_contributors do |t|
      t.string :role
      t.string :name
      t.string :description
      t.string :date_of_birth
      t.string :date_of_death
      t.string :professional_position
      t.string :professional_affiliation
      t.string :website
      t.string :website_description

      t.timestamps
    end
  end
end
