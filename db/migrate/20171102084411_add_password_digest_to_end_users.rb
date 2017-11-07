class AddPasswordDigestToEndUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :end_users, :password_digest, :string
  end
end
