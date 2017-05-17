class CreateInstitutionAccounts < ActiveRecord::Migration[5.0]
  def change
    create_table :institution_accounts do |t|
      t.integer :publisher_id
      t.string :library_name
      t.string :institution_name
      t.string :status
      t.string :display_name
      t.string :logo_file_name
      t.string :logo_content_type
      t.integer :logo_file_size
      t.datetime :logo_updated_at

      t.timestamps
    end
  end
end
