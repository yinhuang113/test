class AddNameIndexToVendorCategories < ActiveRecord::Migration
  def change
    add_index :vendor_categories, :name, unique: true, order: {name: :asc}
  end
end
