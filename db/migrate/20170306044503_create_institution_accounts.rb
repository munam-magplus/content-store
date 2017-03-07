class CreateInstitutionAccounts < ActiveRecord::Migration[5.0]
  def change
    create_table :institution_accounts do |t|
      t.string :pub
      t.string :inst_ID
      t.string :Lib_name
      t.string :inst_name
      t.string :status
      t.string :display_name
      t.string :logo

      t.timestamps
    end
  end
end
