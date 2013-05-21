class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name
      t.text :description
      t.string :cost
      t.string :price
      t.string :manufacture
      t.string :manufacture_part
      t.string :serial_numbers
      t.string :vendor_perferred
      t.string :vendor_other
      t.string :product_type
      t.string :units
      t.string :tax
      t.string :stock_on_hand
      t.string :stock_location
      t.string :references_recent_orders
      t.string :references_companies_who_own

      t.timestamps
    end
  end
end
