class Entrance < ActiveRecord::Base
  attr_accessible :name, :location
  belongs_to :floor
  
  validates :location, presence: true
  validates :floor_id, presence: true
end
