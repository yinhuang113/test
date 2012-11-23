class Mall < ActiveRecord::Base
  attr_accessible :address, :city, :database, :email, :latitude, :longitude, :name, :phone, :state, :zipcode
end
