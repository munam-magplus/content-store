class CreatePublishers < ActiveRecord::Migration[5.0]
  def change
    create_table :publishers do |t|
      t.string :publisher_code
      t.string :publisher_name
      t.string :publisher_status
      t.string :publisher_type
      t.string :end_user_language
      t.string :manager_language
      t.string :contact_first_name
      t.string :contact_last_name
      t.string :contact_email
      t.string :country_code

      t.timestamps
    end
  end
end
