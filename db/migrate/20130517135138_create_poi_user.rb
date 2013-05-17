class CreatePoiUser < ActiveRecord::Migration
  def change
    create_table :pois_users, :id => false do |t|
      t.column :poi_id, :integer
      t.column :user_id, :integer
    end
  end
end
