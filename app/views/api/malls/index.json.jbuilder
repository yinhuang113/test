json.malls @malls do |json, mall|
  json.partial! "api/malls/terse", mall: mall
end
