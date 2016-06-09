class AddAttachmentVenueImgToVenues < ActiveRecord::Migration
  def self.up
    change_table :venues do |t|
      t.attachment :venue_img
    end
  end

  def self.down
    remove_attachment :venues, :venue_img
  end
end
