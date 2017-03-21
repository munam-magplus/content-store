class CreateLicenses < ActiveRecord::Migration[5.0]
  def change
    create_table :licenses do |t|
      t.string :license_id
      t.string :license_name
      t.string :publisher
      t.string :created_on
      t.string :created_by
      t.string :isbn
      t.string :title
      t.string :license_type
      t.string :from
      t.string :to
      t.string :discount

      t.timestamps
    end
  end
end