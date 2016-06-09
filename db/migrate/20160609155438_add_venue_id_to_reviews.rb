class AddVenueIdToReviews < ActiveRecord::Migration
  def change
    add_column :reviews, :venue_id, :integer
  end
end
