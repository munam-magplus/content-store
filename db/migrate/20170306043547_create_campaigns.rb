class CreateCampaigns < ActiveRecord::Migration[5.0]
  def change
    create_table :campaigns do |t|
      t.string :pub
      t.string :campaign_name

      t.timestamps
    end
  end
end
