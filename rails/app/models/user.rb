class User < ActiveRecord::Base
  devise :database_authenticatable, :recoverable, :rememberable, :trackable,
         :validatable

  attr_accessible :email, :password, :password_confirmation, :remember_me
  attr_accessible :title, :first_name, :last_name, :account_id, :role_value
  belongs_to :account
  
  before_save { |user| user.email = email.downcase }
  
  ROLES = {
    admin: 0,
    agent: 1,
    member: 2,
    observer: 3
  }
  
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, :presence => true,
                    :format => { :with => VALID_EMAIL_REGEX },
                    :uniqueness =>  { :case_sensitive => false }
  validates :password, presence: true, length: { minimum: 6 }, confirmation:true, on: :create
  validates :password, presence: true, length: { minimum: 6 }, confirmation:true, on: :update, if: :password_changed?
  validates :role, inclusion: { in: ROLES.keys, message: "is not valid" }
  
  scope :by_account, lambda { |account| where(account_id: account) }
  
  def role
    ROLES.key(read_attribute(:role_value))
  end
  
  def role=(status)
    value = ROLES[status.to_sym]
    raise ArgumentError.new("Invalid role #{role}") if value.blank?
    write_attribute(:role_value, value)
  end
  
  def name
    "#{self.title} #{self.first_name} #{self.last_name}"
  end
  
  def password_changed?
    !@password.blank?
  end
  
end
