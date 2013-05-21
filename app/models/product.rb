class Product < ActiveRecord::Base
  attr_accessible :cost, :description, :manufacture, :manufacture_part, :name, :price, :references_companies_who_own, :references_recent_orders, :serial_numbers, :stock_location, :stock_on_hand, :tax, :product_type, :units, :vendor_other, :vendor_perferred
end
