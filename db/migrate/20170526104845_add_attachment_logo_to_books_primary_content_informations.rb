class AddAttachmentLogoToBooksPrimaryContentInformations < ActiveRecord::Migration
  def self.up
    change_table :books_primary_content_informations do |t|
      t.attachment :logo
    end
  end

  def self.down
    remove_attachment :books_primary_content_informations, :logo
  end
end
