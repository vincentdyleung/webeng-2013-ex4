class DropPoisUsers < ActiveRecord::Migration
  def change
    drop_table :pois_users
  end
end
