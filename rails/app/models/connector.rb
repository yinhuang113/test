class Connector < ActiveRecord::Base
  belongs_to :mall
  has_one :connector_type
  has_many :connector_locations
end
