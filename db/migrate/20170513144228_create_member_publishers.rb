class CreateMemberPublishers < ActiveRecord::Migration[5.0]
  def change
    create_table :member_publishers do |t|
      t.string :member_publisher_code
      t.string :member_publisher_name
      t.string :contact_first_name
      t.string :contact_last_name
      t.string :contact_email
      t.string :member_publisher_status
      t.integer :publisher_borrow_period
      t.float :revenue_share_percentage
      t.integer :publisher_id
      t.string :country_code
      t.string :member_publisher_logo_file_name
      t.string :member_publisher_logo_content_type
      t.integer :member_publisher_logo_file_size
      t.datetime :member_publisher_logo_updated_at

      t.timestamps
    end
  end
end
