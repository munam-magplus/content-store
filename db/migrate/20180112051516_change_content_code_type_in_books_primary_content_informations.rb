class ChangeContentCodeTypeInBooksPrimaryContentInformations < ActiveRecord::Migration[5.0]
  def change
  	change_column :books_primary_content_informations, :content_code, :bigint
  end
end