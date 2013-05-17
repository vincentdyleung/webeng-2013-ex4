class RemoveVoteFromPoi < ActiveRecord::Migration
  def change
    remove_column :pois, :vote
  end
end
