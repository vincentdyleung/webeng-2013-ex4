class AddDefinitiveToPois < ActiveRecord::Migration
  def change
    add_column :pois, :definitive, :boolean
  end
end
