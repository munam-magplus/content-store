class ChangeCommentsTypeInInstitutionAccountBillingAddress < ActiveRecord::Migration[5.0]
  def change
    change_column :institution_account_billing_addresses, :comments, :text
  end
end
