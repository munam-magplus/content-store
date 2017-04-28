class AddAttachmentLogoToInstitutionAccounts < ActiveRecord::Migration
  def self.up
    change_table :institution_accounts do |t|
      t.attachment :logo
    end
  end

  def self.down
    remove_attachment :institution_accounts, :logo
  end
end
