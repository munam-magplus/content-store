class AddPasswordDigestToLibraryUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :library_users, :password_digest, :string
  end
end
