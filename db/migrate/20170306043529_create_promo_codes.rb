class CreatePromoCodes < ActiveRecord::Migration[5.0]
  def change
    create_table :promo_codes do |t|
      t.string :pub
      t.string :campaign
      t.string :no_of_promo_code
      t.string :applicable_discount
      t.string :from
      t.string :to

      t.timestamps
    end
  end
end
