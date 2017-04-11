class AddColumnLicenseForSaleToLicense < ActiveRecord::Migration[5.0]
  def change
  	add_column :licenses, :license_for_sale, :string
  end
end
