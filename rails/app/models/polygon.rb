class Polygon < ActiveRecord::Base
  attr_accessible :floor_id, :label, :vertices
  belongs_to :floor
end
