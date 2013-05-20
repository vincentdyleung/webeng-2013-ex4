class AddFlickrPhotoIdToPois < ActiveRecord::Migration
  def change
    add_column :pois, :flickr_photo_id, :integer
  end
end
