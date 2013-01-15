class Account < ActiveRecord::Base
  attr_accessible :name, :address1, :address2, :city, :state, :zipcode, :email, :phone, :website, :status_value
  has_many :users
  has_many :malls
  
  STATUSES = {
    pending: 0,
    active: 1,
    inactive: 2,
  }
  
  validates :status, inclusion: { in: STATUSES.keys, message: "is not valid" }
  
  def status
    STATUSES.key(read_attribute(:status_value))
  end
  
  def status=(status)
    value = STATUSES[status.to_sym]
    raise ArgumentError.new("Invalid account status #{status}") if value.blank?
    write_attribute(:status_value, value)
  end
end
