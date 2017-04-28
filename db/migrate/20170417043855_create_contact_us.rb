class CreateContactUs < ActiveRecord::Migration[5.0]
  def change
    create_table :contact_us do |t|
      t.string :subject
      t.string :topic
      t.integer :phone_number
      t.integer :fax_number
      t.string :comments

      t.timestamps
    end
  end
end
