class VendorCategory < ActiveRecord::Base
  attr_accessible :name
  has_and_belongs_to_many :vendors, foreign_key: 'category_id'
end
