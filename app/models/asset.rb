class Asset < ActiveRecord::Base
  attr_accessible :company, :contact, :cost, :date_of_installation, :description, :license_key, :manufacturer, :name, :price, :product, :refer_invoices, :refer_locations, :refer_projects, :refer_purchase_order, :refer_sales_order, :refer_tickets, :serial_numbers, :type, :warranty_date_end, :warranty_date_start
end
