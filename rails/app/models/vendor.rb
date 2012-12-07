class Vendor < ActiveRecord::Base
  attr_accessible :contact_email, :description, :logo, :name, :website, :category_ids
  has_and_belongs_to_many :categories, class_name: 'VendorCategory', association_foreign_key: 'category_id'
  validates :name, presence: true
end
