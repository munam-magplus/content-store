class AddColumnsToAdminUser < ActiveRecord::Migration[5.0]
  def change
    add_column :admin_users, :password, :string
    add_column :admin_users, :confirm_password, :string
  end
end
