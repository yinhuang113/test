class User < ActiveRecord::Base
  attr_accessible :company, :contact_id, :email, :email_private, :extension, :fax, :firstName, :home_phone, :lastName, :mobile, :notes, :phone, :site_city, :site_phone, :site_zip, :title
end
