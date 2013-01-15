json.floors @floors do |json, floor|
  json.partial! "api/floors/terse", floor: floor
end
