class Entrance < ActiveRecord::Base
  attr_accessible :floor_id, :name, :location
  belongs_to :floor
  
  validates :location, presence: true
  validates :floor_id, presence: true
end
