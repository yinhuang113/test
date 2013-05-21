class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.integer :company_id
      t.string :approver
      t.string :phone
      t.string :project_extension
      t.string :site_city
      t.string :site_zip
      t.string :site_phone
      t.datetime :start_date
      t.datetime :end_date
      t.boolean :status
      t.string :project_type
      t.string :project_manager
      t.string :budgeted_hours
      t.string :budgeted_expenses
      t.text :description
      t.text :notes
      t.string :tasks
      t.string :resources_name
      t.string :resources_role
      t.string :schedule
      t.string :products_name
      t.string :products_cost
      t.string :products_price
      t.string :products_purchase_order
      t.string :products_bin
      t.string :account_manager
      t.string :open_issues
      t.string :time_entry_standard
      t.string :time_entry_completed
      t.string :expenses
      t.string :phone_logs
      t.text :documents
      t.string :survery_results
      t.string :knowledgebase_articles
      t.string :phases
      t.string :billing_method_terms
      t.string :billing_method_approver
      t.string :downpayment_info_amount
      t.string :downpayment_info_breakdown
      t.string :downpayment_info_invoice
      t.string :downpayment_info_datepaid
      t.string :invoices

      t.timestamps
    end
  end
end
