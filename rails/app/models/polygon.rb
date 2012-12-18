class Polygon < ActiveRecord::Base
  attr_accessible :label, :vertices
  belongs_to :floor
end
