class AddLicenseIsLinkableToLicense < ActiveRecord::Migration[5.0]
  def change
    add_column :licenses, :license_is_linkable, :string
    add_column :licenses, :license_link_to_date, :date
    add_column :licenses, :license_link_from_date, :date
    add_column :licenses, :license_shipping_is_free, :string
    add_column :licenses, :license_discount_percentage, :integer
  end
end
