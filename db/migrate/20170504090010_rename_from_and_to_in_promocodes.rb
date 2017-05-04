class RenameFromAndToInPromocodes < ActiveRecord::Migration[5.0]
 def change
  rename_column :promo_codes, :from, :valid_from
  rename_column :promo_codes, :to, :valid_to
  change_column :promo_codes, :valid_from, :date
  change_column :promo_codes, :valid_to, :date
 end
end
