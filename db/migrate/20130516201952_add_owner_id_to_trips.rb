class AddOwnerIdToTrips < ActiveRecord::Migration
  def change
    add_column :trips, :owner_id, :integer
    add_index :trips, :owner_id
  end
end
