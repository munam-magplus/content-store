class AddAttachmentTemplateToThemes < ActiveRecord::Migration
  def self.up
    change_table :themes do |t|
      t.attachment :template
    end
  end

  def self.down
    remove_attachment :themes, :template
  end
end
