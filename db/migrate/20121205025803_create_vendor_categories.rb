class CreateVendorCategories < ActiveRecord::Migration
  def change
    create_table :vendor_categories do |t|
      t.string :name

      t.timestamps
    end
    
    create_table :vendor_categories_vendors, :id => false do |t|
      t.integer :vendor_id
      t.integer :category_id
    end
    
    VendorCategory.create(name: 'Major')
    VendorCategory.create(name: 'Card, Books, Gifts')
    VendorCategory.create(name: "Children's Fashions")
    VendorCategory.create(name: 'Eyewear & Optometry')
    VendorCategory.create(name: 'Food Services')
    VendorCategory.create(name: 'Food Specialty')
    VendorCategory.create(name: 'Footwear')
    VendorCategory.create(name: 'Health & Beauty')
    VendorCategory.create(name: 'Home')
    VendorCategory.create(name: 'Jewellery & Accessories')
    VendorCategory.create(name: 'Medical & Dental')
    VendorCategory.create(name: "Men's Fashions")
    VendorCategory.create(name: 'Photo & Electronics')
    VendorCategory.create(name: 'Restaurant')
    VendorCategory.create(name: 'Services')
    VendorCategory.create(name: 'Specialty Retail')
    VendorCategory.create(name: 'Sporting Goods')
    VendorCategory.create(name: 'Telecommunication')
    VendorCategory.create(name: 'Unisex Fashions')
    VendorCategory.create(name: "Women's Fashions")
  end
end
