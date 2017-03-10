class CreateInstitutionAccounts < ActiveRecord::Migration[5.0]
  def change
    create_table :institution_accounts do |t|
      t.string :publisher
      t.string :institution_id
      t.string :libary_name
      t.string :institution_name
      t.string :status
      t.string :display_name
      t.string :logo

      t.timestamps
    end
  end
end
