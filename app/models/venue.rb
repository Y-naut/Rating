class Venue < ActiveRecord::Base
	belongs_to :user
	belongs_to :category
	has_many :reviews

	has_attached_file :venue_img, :styles => { :venue_index => "250x350>", :venue_show => "325x475>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :venue_img, content_type: /\Aimage\/.*\Z/
	
end
