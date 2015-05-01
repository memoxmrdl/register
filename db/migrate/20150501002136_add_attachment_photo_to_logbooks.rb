class AddAttachmentPhotoToLogbooks < ActiveRecord::Migration
  def self.up
    change_table :logbooks do |t|
      t.attachment :photo
    end
  end

  def self.down
    remove_attachment :logbooks, :photo
  end
end
