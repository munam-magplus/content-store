class AddLicenseIdToBooksPrimaryContentInfos < ActiveRecord::Migration[5.0]
  def change
    add_column :books_primary_content_infos, :license_id, :integer
  end
end
