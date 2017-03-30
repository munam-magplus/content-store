class RemoveCreatedOnFromLicense < ActiveRecord::Migration[5.0]
  def change
    remove_column :licenses, :created_on, :date
  end
end
