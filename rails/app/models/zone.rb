class Zone < ActiveRecord::Base
  attr_accessible :label, :polygon_id, :zone_type_id
  has_one :polygon
  has_one :zone_type
end
