class Company < ActiveRecord::Base
  attr_accessible :agreements_devices_cost, :agreements_devices_count, :agreements_devices_price, :agreements_endstart, :agreements_lastinvoiceamount, :agreements_startdate, :agrements_cycle, :agrements_terms, :billing_contact_email, :billing_contact_fn, :billing_contact_ln, :billing_contact_phone, :billing_contact_title, :billing_info_account_type, :billing_info_approval_level, :billing_info_approver, :city, :contact_id, :devices, :fax, :industry, :invoices, :knowledgebase_articles, :company_name, :open_credit_invoices, :open_invoices, :phone, :primary_contact_fn, :primary_contact_ln, :s_afterhourscontactname, :s_afterhourscontactphone, :s_city, :s_hours, :s_map, :s_phone, :s_round_trip_mileage, :s_state, :s_street_add, :s_tolls, :sales_activities, :software_expiration, :software_licenses, :software_name, :state, :status, :street, :website, :zip
end