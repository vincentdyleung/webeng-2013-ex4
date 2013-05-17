class Trip < ActiveRecord::Base
  belongs_to :owner, :class_name => "User"
  has_many :pois, :dependent => :nullify
  has_and_belongs_to_many :participants, :class_name => "User"
  
end
