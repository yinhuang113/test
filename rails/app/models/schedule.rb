class Schedule < ActiveRecord::Base
  attr_accessible :mall_id, :priority, :name, :start_date, :end_date
  belongs_to :mall
  
  validates :priority, presence: true, numericality: { only_integer: true }
  validates :name, presence: true
  validates :start_date, presence: true
end
