class ChangeDefinitiveInPois < ActiveRecord::Migration
  def change
    change_column :pois, :definitive, :boolean, { :default => false }
  end
end
