class Mall < ActiveRecord::Base
  attr_accessible :account_id, :address, :city, :database, :email, :latitude, :longitude, :name, :phone, :state, :zipcode
  belongs_to :account
  has_many :floors
  has_many :schedules
  has_many :stores
  has_many :connectors
  
  scope :by_account, lambda { |account| where(account_id: account) }
end
