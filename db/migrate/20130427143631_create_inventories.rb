class CreateInventories < ActiveRecord::Migration
  def change
    create_table :inventories do |t|
      t.string :product
      t.string :manufacture
      t.string :manufacture_part
      t.string :vendor_perferred
      t.string :vendor_other
      t.string :inventory_type
      t.string :units
      t.string :tax
      t.string :stock_on_hand
      t.string :stock_location
      t.string :references_sales_orders
      t.string :references_companies_who_own
      t.string :references_purchase_orders
      t.string :references_rmas

      t.timestamps
    end
  end
end
