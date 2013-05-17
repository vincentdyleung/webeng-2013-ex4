class CreateTripsUsers < ActiveRecord::Migration
  def change
    create_table :trips_users, :id => false do |t|
      t.column :trip_id, :integer
      t.column :user_id, :integer
    end
  end
end
