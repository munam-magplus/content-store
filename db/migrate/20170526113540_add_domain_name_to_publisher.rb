class AddDomainNameToPublisher < ActiveRecord::Migration[5.0]
  def change
    add_column :publishers, :domain_name, :string
  end
end
