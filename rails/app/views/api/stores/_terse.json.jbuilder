json.(store, :id, :description, :email, :telephone, :website)
json.vendor(store.vendor, :id, :logo, :name, :description, :contact_email, :website)
json.category(store.vendor_category.name) if store.vendor_category
json.polygon(store.polygon, :label, :vertices) if store.polygon
