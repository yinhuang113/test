json.(floor, :id, :order, :label, :main)
json.connector_locations(floor.connector_locations, :connector_id, :location)
json.entrances(floor.entrances, :name, :location)
