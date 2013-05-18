class AddImageUrlToPois < ActiveRecord::Migration
  def change
    add_column :pois, :image_url, :string
  end
end
