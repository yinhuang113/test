class ZoneType < ActiveRecord::Base
  attr_accessible :name
  belongs_to :zone
end
