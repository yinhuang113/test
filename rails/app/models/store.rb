class Store < ActiveRecord::Base
  attr_accessible :description, :email, :telephone, :website
  belongs_to :mall
  belongs_to :vendor
  has_one :polygon
  has_one :vendor_category
  
  validates :mall, presence: true
  validates :vendor, presence: true
  validates :polygon, presence: true, on: :create
end
