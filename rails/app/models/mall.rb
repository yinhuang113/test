class Mall < ActiveRecord::Base
  attr_accessible :account_id, :address, :city, :database, :email, :latitude, :longitude, :name, :phone, :state, :zipcode
  belongs_to :account
  has_many :floors, dependent: :destroy
  has_many :schedules, dependent: :destroy
  has_many :connectors, dependent: :destroy
  has_many :stores, dependent: :destroy
  has_many :zones, dependent: :destroy
  has_many :entrances, through: :floors
  
  scope :by_account, lambda { |account| where(account_id: account) }
end
