class User < ActiveRecord::Base
	has_secure_password
	validates_presence_of :password, :on => :create
	has_many :trips_owned, :class_name => "Trip", :foreign_key => "owner_id"
	has_and_belongs_to_many :trips_joined, :class_name => "Trip"
	has_many :votes
	has_many :pois, :through => :votes
	
	def twitter_connected?
	  return !self.token.nil? && !self.secret.nil?
  end
  
end
