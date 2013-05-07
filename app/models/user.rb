class User < ActiveRecord::Base
	has_secure_password
	validates_presence_of :password, :on => :create
	has_many :trips
	has_and_belongs_to_many :trips
end
