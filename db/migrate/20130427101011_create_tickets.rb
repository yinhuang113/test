class CreateTickets < ActiveRecord::Migration
  def change
    create_table :tickets do |t|
      t.integer :company_id
      t.integer :user_id
      t.string :phone
      t.string :ticket_extension
      t.string :email
      t.string :site_city
      t.string :site_zip
      t.string :site_phone
      t.string :agreement_project
      t.string :status
      t.string :ticket_type
      t.string :ticket_location
      t.string :source
      t.string :budgeted_hours
      t.string :priority_level
      t.text :description
      t.text :notes
      t.string :tasks
      t.string :resource
      t.string :schedule
      t.string :device
      t.string :despatcher
      t.string :account_manager
      t.string :open_tickets_device
      t.integer :open_ticket_user_id
      t.integer :open_ticket_company_id
      t.string :alerts
     t.string :time_entry_standard
      t.string :time_entry_completed
      t.text :phone_logs
      t.text :documents
      t.string :sales_task
      t.string :products_name
      t.string :products_price
      t.string :products_stocklevel
      t.string :expenses
      t.string :survey_results
      t.string :knowledgebase_articles

      t.timestamps
    end
  end
end
