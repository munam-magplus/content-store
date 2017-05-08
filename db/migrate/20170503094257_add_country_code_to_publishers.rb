class AddCountryCodeToPublishers < ActiveRecord::Migration[5.0]
  def change
    add_column :publishers, :country_code, :string
  end
end
