class Connector < ActiveRecord::Base
  attr_accessible :mall_id, :connector_type_id, :connector_locations_attributes
  belongs_to :mall
  belongs_to :connector_type
  has_many :connector_locations, dependent: :destroy
  accepts_nested_attributes_for :connector_locations, allow_destroy: true, reject_if: lambda { |loc| loc[:location].blank? }
  
  validates :mall_id, presence: true
  validates :connector_type_id, presence: true
end
