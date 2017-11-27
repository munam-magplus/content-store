class AddBookPrimaryContentInformationIdToSubscriptionBooks < ActiveRecord::Migration[5.0]
  def change
    add_column :subscription_books, :books_primary_content_information_id, :integer
  end
end
