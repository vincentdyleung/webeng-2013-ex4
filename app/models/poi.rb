class Poi < ActiveRecord::Base
  belongs_to :trip
  has_many :votes
  has_many :users, :through => :votes
  validates :name, :location, :presence => true
  validates :name, :uniqueness => true
  
  def <=> (other)
    Vote.find_all_by_poi_id(self.id).count <=> Vote.find_all_by_poi_id(other.id).count
  end
  
end
