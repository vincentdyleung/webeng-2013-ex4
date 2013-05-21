class Poi < ActiveRecord::Base
  belongs_to :trip
  has_many :votes
  has_many :users, :through => :votes
  validates :name, :location, :presence => true
  validates :name, :uniqueness => true
end
