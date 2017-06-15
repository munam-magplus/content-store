class AddColumnToPublisher < ActiveRecord::Migration[5.0]
  def change
    add_column :publishers, :welcome_text, :text
    add_column :publishers, :news_and_events, :text
  end
end
