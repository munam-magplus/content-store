class AddCountryCodeToMemberPublishers < ActiveRecord::Migration[5.0]
  def change
    add_column :member_publishers, :country_code, :string
  end
end
