class ConnectorLocation < ActiveRecord::Base
  belongs_to :floor
  belongs_to :connector
  attr_accessible :location
end
