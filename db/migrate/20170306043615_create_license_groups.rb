class CreateLicenseGroups < ActiveRecord::Migration[5.0]
  def change
    create_table :license_groups do |t|
      t.string :license_group_id
      t.string :license_group_name
      t.string :publisher
      t.string :created_by
      t.string :license_id
      t.string :license_name
      t.string :license_type
      t.string :content_identifier
      t.string :from
      t.string :to
      t.string :purchase_info_discount
      t.string :license_for_sale

      t.timestamps
    end
  end
end
