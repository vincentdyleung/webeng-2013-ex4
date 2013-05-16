class AddTripIdToPoi < ActiveRecord::Migration
  def change
    add_column :pois, :trip_id, :integer
  end
end
