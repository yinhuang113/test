class Zone < ActiveRecord::Base
  attr_accessible :mall_id, :zone_type_id, :polygon_id, :label, :polygon_attributes
  belongs_to :mall
  belongs_to :zone_type
  belongs_to :polygon
  accepts_nested_attributes_for :polygon
  
  validates :mall, presence: true
  validates :zone_type, presence: true
  validates :polygon, presence: true, on: :create
end
