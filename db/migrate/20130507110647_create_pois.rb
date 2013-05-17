class CreatePois < ActiveRecord::Migration
  def change
    create_table :pois do |t|
      t.string :name
      t.string :location
      t.string :description
      t.integer :vote

      t.timestamps
    end
  end
end
