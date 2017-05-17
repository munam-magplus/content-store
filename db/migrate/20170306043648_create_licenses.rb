class CreateLicenses < ActiveRecord::Migration[5.0]
  def change
    create_table :licenses do |t|
      t.string :license_code
      t.string :license_name
      t.integer :publisher
      t.string :created_by
      t.integer :isbn
      t.string :title
      t.string :license_type
      t.date :valid_from
      t.date :valid_to
      t.string :license_for_sale
      t.string :license_is_linkable
      t.date :license_link_to_date
      t.date :license_link_from_date
      t.string :license_shipping_is_free
      t.float :license_discount_percentage
      t.integer :license_group_id

      t.timestamps
    end
  end
end
