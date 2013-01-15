class ConnectorLocation < ActiveRecord::Base
  attr_accessible :floor_id, :connector_id, :location
  belongs_to :floor
  belongs_to :connector
  
  validates :floor_id, presence: true
  validates :location, presence: true
end
