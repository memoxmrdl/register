class AddAttachmentCredentialToLogbooks < ActiveRecord::Migration
  def self.up
    change_table :logbooks do |t|
      t.attachment :credential
    end
  end

  def self.down
    remove_attachment :logbooks, :credential
  end
end
