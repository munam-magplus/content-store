class CreateCampaigns < ActiveRecord::Migration[5.0]
  def change
    create_table :campaigns do |t|
      t.integer :publisher_id
      t.string :campaign_name
      t.string :created_by

      t.timestamps
    end
  end
end
