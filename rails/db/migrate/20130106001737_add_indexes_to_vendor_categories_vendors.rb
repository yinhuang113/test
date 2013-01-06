class AddIndexesToVendorCategoriesVendors < ActiveRecord::Migration
  def change
    add_index :vendor_categories_vendors, [:vendor_id, :category_id], unique: true
    add_index :vendor_categories_vendors, :vendor_id
  end
end
