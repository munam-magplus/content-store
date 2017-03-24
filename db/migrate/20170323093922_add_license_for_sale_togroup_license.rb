class AddLicenseForSaleTogroupLicense < ActiveRecord::Migration[5.0]
  def change
    add_column :license_groups, :license_for_sale, :string
  end
end
