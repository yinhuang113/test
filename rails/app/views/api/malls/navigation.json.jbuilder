json.(@mall, :id, :name, :latitude, :longitude)
json.floors(@mall.floors) do |json, floor|
  json.partial!("api/floors/full", floor: floor)
end
json.connectors(@mall.connectors) do |json, connector|
  json.connector do
    json.type(connector.connector_type.name) if connector.connector_type
    json.locations(connector.connector_locations, :floor_id, :location)
  end
end
json.entrances(@mall.entrances, :name, :location, :floor_id)
