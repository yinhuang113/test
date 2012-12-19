class User < ActiveRecord::Base
  devise :database_authenticatable, :recoverable, :rememberable, :trackable,
         :validatable

  attr_accessible :email, :password, :password_confirmation, :remember_me
  attr_accessible :title, :first_name, :last_name, :account_id
  belongs_to :account
  
  before_save { |user| user.email = email.downcase }
  
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, :presence => true,
                    :format => { :with => VALID_EMAIL_REGEX },
                    :uniqueness =>  { :case_sensitive => false }
  validates :password, presence: true, length: { minimum: 6 }
  validates :password_confirmation, :presence => true
end
