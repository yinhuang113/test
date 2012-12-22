require "../config/environment.rb"
require "csv"

data = File.read('real_estate_mapping')
real_estate_mapping = Marshal.load(data)

mapping = {}
Account.transaction do
  CSV.foreach(ARGV[0], headers: true) do |row|
    hash = row.to_hash
    
    mall = Mall.new
    mall.account_id = real_estate_mapping[hash["REAL_ESTATE_ID"]]
    mall.name = hash["MALLNAME"]
    mall.address = hash["MGMT_ADD1"]
    mall.city = hash["MGMT_CITY"]
    mall.state = hash["MGMT_STAT"]
    mall.zipcode = hash["MGMT_ZIP"]
    mall.website = hash["MM_WEB"]
    mall.latitude = hash["DEC_LAT"]
    mall.longitude = hash["DEC_LION"]
    mall.phone = hash["CUSTOMER_SERVICE_NUMBER"]
    
    if !mall.save
      puts mall.errors.first
      puts "For record: #{hash}"
      raise ArgumentError
    end
    mapping[hash['ID']] = mall.id
  end
end

data = Marshal.dump(mapping)
open('mall_mapping', 'wb') { |f| f.puts data }
