class CreateSubscriptionInstitutes < ActiveRecord::Migration[5.0]
  def change
    create_table :subscription_institutes do |t|
      t.timestamps
      
    end
  end
end
