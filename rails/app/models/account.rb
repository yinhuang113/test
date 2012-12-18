class Account < ActiveRecord::Base
  attr_accessible :name, :status_value
  has_many :users
end
