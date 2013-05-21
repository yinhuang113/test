class CreateCompanies < ActiveRecord::Migration
  def change
    create_table :companies do |t|
      t.integer :contact_id
      t.string :company_name
      t.string :phone
      t.string :fax
      t.string :website
      t.string :industry
      t.string :status
      t.string :street
      t.string :city
      t.string :state
      t.string :zip
      t.string :primary_contact_fn
      t.string :primary_contact_ln
      t.string :s_street_add
      t.string :s_city
      t.string :s_state
      t.string :s_phone
      t.string :s_hours
      t.string :s_afterhourscontactname
      t.string :s_afterhourscontactphone
      t.string :s_round_trip_mileage
      t.string :s_tolls
      t.string :s_map
      t.string :sales_activities
      t.string :devices
      t.string :software_name
      t.string :software_licenses
      t.string :software_expiration
      t.string :invoices
      t.string :open_invoices
      t.string :open_credit_invoices
      t.string :billing_contact_fn
      t.string :billing_contact_ln
      t.string :billing_contact_title
      t.string :billing_contact_email
      t.string :billing_contact_phone
      t.string :billing_info_account_type
      t.string :billing_info_approval_level
      t.string :billing_info_approver
      t.text :knowledgebase_articles
      t.string :agrements_terms
      t.string :agrements_cycle
      t.datetime :agreements_startdate
      t.datetime :agreements_endstart
      t.string :agreements_lastinvoiceamount
      t.string :agreements_devices_count
      t.string :agreements_devices_cost
      t.string :agreements_devices_price

      t.timestamps
    end
  end
end
