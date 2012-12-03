class Vendor < ActiveRecord::Base
  attr_accessible :contact_email, :description, :logo, :name, :website
  validates :name, presence: true
end
