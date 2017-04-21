class RenameConfirmationPasswordFromLibraryUsersToPasswordConfirmation < ActiveRecord::Migration[5.0]
  def change
  	rename_column :library_users, :confirm_password, :password_confirmation
  end
end
