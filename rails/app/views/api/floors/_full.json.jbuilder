json.(floor, :id, :order, :label, :main)

json.stores(floor.stores) do |json, store|
  json.(store, :id)
  json.polygon(store.polygon, :label, :vertices) if store.polygon
end

json.zones(floor.zones) do |json, zone|
  json.(zone, :label)
  json.type(zone.zone_type.name) if zone.zone_type
  json.polygon(zone.polygon, :label, :vertices) if zone.polygon
end
