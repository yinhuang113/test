json.(store, :id, :description, :email, :telephone, :website)
json.vendor(store.vendor, :id, :logo, :name, :description, :contact_email, :website)
json.category(store.vendor_category.name)
json.polygon(store.polygon, :label, :vertices)
