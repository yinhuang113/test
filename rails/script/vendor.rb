require "../config/environment.rb"
require "csv"

mapping = {}
Vendor.transaction do
  CSV.foreach(ARGV[0], headers: true) do |row|
    hash = row.to_hash
    
    vendor = Vendor.new
    vendor.name = hash["NAME"]
    vendor.description = hash["DESCRIPTION"]
    vendor.category_ids = [hash["CATEGORY_ID"].to_i + 1]
    
    if !vendor.save
      puts vendor.errors.first
      puts "For record: #{hash}"
      raise ArgumentError
    end
    mapping[hash['ID']] = vendor.id
  end
end

data = Marshal.dump(mapping)
open('vendor_mapping', 'wb') { |f| f.puts data }
