json.(mall, :id, :address, :city, :email, :latitude, :longitude, :name, :phone, :state, :zipcode)
json.schedule do |json|
  if schedule
    json.(schedule, :name, :start_date, :end_date)
    if schedule.intervals
      json.intervals(schedule.intervals, :day, :name, :open_time, :close_time)
    end
  end
end
