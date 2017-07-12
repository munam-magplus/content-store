class AddPublisherAddressToPublisher < ActiveRecord::Migration[5.0]
  def change
    add_column :publishers, :publisher_address, :text
  end
end
