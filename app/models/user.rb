class User < ActiveRecord::Base
	has_secure_password
	validates_presence_of :password, :on => :create
	has_many :trips, :foreign_key => "owner_id"
	#has_and_belongs_to_many :trips
end
