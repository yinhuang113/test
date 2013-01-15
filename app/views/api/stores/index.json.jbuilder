json.stores @stores do |json, store|
  json.partial! "api/stores/terse", store: store
end
