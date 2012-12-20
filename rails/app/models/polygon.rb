class Polygon < ActiveRecord::Base
  attr_accessible :floor_id, :label, :vertices, :from_svg
  belongs_to :floor
end
