class Store < ActiveRecord::Base
  attr_accessible :mall_id, :vendor_id, :vendor_category_id, :polygon_id, :description, :email, :telephone, :website, :polygon_attributes
  belongs_to :mall
  belongs_to :vendor
  belongs_to :vendor_category
  belongs_to :polygon
  accepts_nested_attributes_for :polygon
  
  validates :mall, presence: true
  validates :vendor, presence: true
  validates :polygon, presence: true, on: :create
end
