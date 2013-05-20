class ChangePoi < ActiveRecord::Migration
  def change
    rename_column :pois, :flickr_photo_id, :photo_page_url
    change_column :pois, :photo_page_url, :string
  end
end
