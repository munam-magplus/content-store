class CreateLicenses < ActiveRecord::Migration[5.0]
  def change
    create_table :licenses do |t|
      t.string :lic_ID
      t.string :lic_name
      t.string :pub
      t.string :created_on
      t.string :created_by
      t.string :ISBN
      t.string :title
      t.string :lic_type
      t.string :from
      t.string :to
      t.string :discount

      t.timestamps
    end
  end
end
