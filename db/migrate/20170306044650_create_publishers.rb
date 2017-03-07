class CreatePublishers < ActiveRecord::Migration[5.0]
  def change
    create_table :publishers do |t|
      t.string :pub_code
      t.string :pub_name
      t.string :pub_status
      t.string :pub_type
      t.string :end_user_lang
      t.string :manager_lang
      t.string :contact_first_name
      t.string :contact_last_name
      t.string :contact_email

      t.timestamps
    end
  end
end
