class DropTableContactUs < ActiveRecord::Migration[5.0]
  def change
  	drop_table :contact_us
  end
end
