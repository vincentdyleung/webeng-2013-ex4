class Trip < ActiveRecord::Base
  belongs_to :user
  has_many :pois
  #has_and_belongs_to_many :users
end
