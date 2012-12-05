class CreateVendors < ActiveRecord::Migration
  def change
    create_table :vendors do |t|
      t.string :name
      t.text :description
      t.text :website
      t.string :contact_email
      t.text :logo

      t.timestamps
    end
    add_index :vendors, :name
    Vendor.all
  end
end
