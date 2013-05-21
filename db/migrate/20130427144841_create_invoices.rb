class CreateInvoices < ActiveRecord::Migration
  def change
    create_table :invoices do |t|
      t.string :company_name
      t.string :phone
      t.string :fax
      t.string :status
      t.string :site_street_address
      t.string :site_city
      t.boolean :site_state
      t.string :site_zip
      t.string :site_phone
      t.string :site_business_hours
      t.string :site_round_trip_mileage
      t.string :site_tolls
      t.string :site_map
      t.string :open_invoices
      t.string :open_credit_invoices
      t.string :billing_contact__fn
      t.string :billing_contact_ln
      t.string :billing_contact_title
      t.string :billing_contact_email
      t.string :billing_contact_phone
      t.string :billing_info_account_type
      t.string :billing_info_approval_level
      t.string :billing_info_approver
      t.string :agreement_terms
      t.string :agreement_included
      t.string :agreement_excluded
      t.string :invoice_due_date
      t.string :charges_products
      t.datetime :charges_time
      t.string :charges_expenses
      t.string :charges_tax
      t.string :invoiced_sales_order
      t.string :invoiced_ticket_number
      t.string :invoiced_purchase_order
      t.string :commission_product
      t.string :commission_service

      t.timestamps
    end
  end
end
