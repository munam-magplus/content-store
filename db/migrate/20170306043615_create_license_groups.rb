class CreateLicenseGroups < ActiveRecord::Migration[5.0]
  def change
    create_table :license_groups do |t|
      t.string :lic_group_ID
      t.string :lic_group_name
      t.string :pub
      t.string :created_on
      t.string :created_by
      t.string :lic_ID
      t.string :lic_name
      t.string :lic_type
      t.string :content_identifier
      t.string :from
      t.string :to
      t.string :purchase_infodiscount

      t.timestamps
    end
  end
end
