class Schedule < ActiveRecord::Base
  attr_accessible :mall_id, :priority, :name, :start_date, :end_date
  belongs_to :mall
  has_many :intervals, class_name: 'ScheduleInterval', dependent: :destroy
  
  validates :priority, presence: true, numericality: { only_integer: true }
  validates :name, presence: true
  validates :start_date, presence: true
  
  scope :by_date, proc { |date| where('(start_date IS NULL OR start_date <= ?) AND (end_date IS NULL OR end_date > ?)', date, date) }
  
  def self.current(mall)
    date = Time.zone.now
    where('mall_id = ? AND (start_date IS NULL OR start_date <= ?) AND (end_date IS NULL OR end_date > ?)', mall.id, date, date).order('priority DESC').first
  end
end
