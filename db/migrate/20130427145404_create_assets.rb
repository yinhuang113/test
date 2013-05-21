class CreateAssets < ActiveRecord::Migration
  def change
    create_table :assets do |t|
      t.string :company
      t.string :contact
      t.string :product
      t.string :name
      t.text :description
      t.string :cost
      t.string :price
      t.string :manufacturer
      t.string :serial_numbers
      t.string :asset_type
      t.string :refer_tickets
      t.string :refer_projects
      t.string :refer_locations
      t.string :refer_purchase_order
      t.string :refer_sales_order
      t.string :refer_invoices
      t.string :date_of_installation
      t.datetime :warranty_date_start
      t.datetime :warranty_date_end
      t.string :license_key

      t.timestamps
    end
  end
end
