class CreateStores < ActiveRecord::Migration
  def change
    create_table :stores do |t|
      t.belongs_to :mall, null: false
      t.belongs_to :vendor, null: false
      t.references :polygon, null: false
      t.references :vendor_category
      t.text :description
      t.string :telephone
      t.string :website
      t.string :email

      t.timestamps
    end
    add_index :stores, :mall_id
    add_index :stores, :vendor_id
  end
end
