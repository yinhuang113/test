class ScheduleInterval < ActiveRecord::Base
  attr_accessible :schedule_id, :day, :name, :open_time, :close_time, :open_hour, :open_minute, :close_hour, :close_minute
  belongs_to :schedule
  
  validates :day, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 1, less_than_or_equal_to: 7 }
  #validates :open_time, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0, less_than_or_equal_to: 96 }
  #validates :close_time, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0, less_than_or_equal_to: 96 }
  
  def self.day_name(day_id)
    case day_id
    when 1 then "Monday"
    when 2 then "Tuesday"
    when 3 then "Wednesday"
    when 4 then "Thrusday"
    when 5 then "Friday"
    when 6 then "Saturday"
    when 7 then "Sunday"
    end
  end
  
  def open_hour=(hour)
    minute = self.open_time ? self.open_time % 4 : 0
    self.open_time = hour.to_i * 4 + minute
  end
  
  def open_hour
    self.open_time ? self.open_time / 4 : 0
  end
  
  def open_minute=(minute)
    hour = self.open_time ? self.open_time / 4 : 0
    self.open_time = hour * 4 + minute.to_i / 15
  end
  
  def open_minute
     self.open_time ? (self.open_time % 4) * 15 : 0
  end

  def open_string
    "#{self.open_hour}".rjust(2, '0') + ":" + "#{self.open_minute}".rjust(2, '0')
  end
  
  def close_hour=(hour)
    minute = self.close_time ? self.close_time % 4 : 0
    self.close_time = hour.to_i * 4 + minute
  end

  def close_hour
     self.close_time ? self.close_time / 4 : 0
  end

  def close_minute=(minute)
    hour = self.close_time ? self.close_time / 4 : 0
    self.close_time = hour * 4 + minute.to_i / 15
  end

  def close_minute
    self.close_time ? (self.close_time % 4) * 15 : 0
  end

  def close_string
    "#{self.close_hour}".rjust(2, '0') + ":" + "#{self.close_minute}".rjust(2, '0')
  end
end
