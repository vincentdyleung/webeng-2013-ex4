class Trip < ActiveRecord::Base
  belongs_to :owner, :class_name => "User"
  has_many :pois
  has_and_belongs_to_many :participants, :class_name => "User"
  validates :city, :presence => true
  
  before_destroy do 
    self.pois.each do |poi|
      poi.trip_id = nil
      poi.definitive = false
      poi.save
    end
  end
end
