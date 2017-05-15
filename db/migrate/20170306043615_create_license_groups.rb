class CreateLicenseGroups < ActiveRecord::Migration[5.0]
  def change
    create_table :license_groups do |t|
      t.string :license_group_code
      t.string :license_group_name
      t.integer :publisher_id
      t.string :created_by
      t.string :license_id
      t.string :license_name
      t.string :license_type
      t.string :content_identifier
      t.date :valid_from
      t.date :valid_to
      t.string :purchase_information
      t.integer :discount_percentage
      t.string :license_for_sale

      t.timestamps
    end
  end
end
