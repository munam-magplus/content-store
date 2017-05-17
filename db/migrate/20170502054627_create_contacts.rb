class CreateContacts < ActiveRecord::Migration[5.0]
  def change
    create_table :contacts do |t|
      t.string :subject
      t.string :topic
      t.string :phone_number
      t.integer :fax_number
      t.string :comments
      t.string :email

      t.timestamps
    end
  end
end
