class CreateMemberPublishers < ActiveRecord::Migration[5.0]
  def change
    create_table :member_publishers do |t|
      t.string :member_publisher_code
      t.string :member_publisher_name
      t.string :contact_first_name
      t.string :contact_last_name
      t.string :contact_email
      t.string :member_publisher_status
      t.string :member_publisher_logo
      t.integer :publisher_borrow_period
      t.integer :revenue_share_percentage
      t.integer :publisher_id
      t.string :country_code
    end
  end
end
