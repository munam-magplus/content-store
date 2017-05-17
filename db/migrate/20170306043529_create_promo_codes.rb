class CreatePromoCodes < ActiveRecord::Migration[5.0]
  def change
    create_table :promo_codes do |t|
      t.integer :publisher_id
      t.integer :campaign_id
      t.integer :number_of_promo_code
      t.float :applicable_discount
      t.date :valid_from
      t.date :valid_to

      t.timestamps
    end
  end
end
