class CreateLicenses < ActiveRecord::Migration[5.0]
  def change
    create_table :licenses do |t|
      t.string :license_id
      t.string :license_name
      t.string :publisher
      t.string :created_by
      t.string :isbn
      t.string :title
      t.string :license_type
      t.string :from
      t.string :to
      t.string :discount
      t.string :license_for_sale
      t.string :license_is_linkable
      t.date :license_link_to_date
      t.date :license_link_from_date
      t.string :license_shipping_is_free
      t.integer :license_discount_percentage

      t.timestamps
    end
  end
end
