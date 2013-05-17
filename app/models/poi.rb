class Poi < ActiveRecord::Base
  belongs_to :trip
  has_many :votes
  has_many :users, :through => :votes
end
