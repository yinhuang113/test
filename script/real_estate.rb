require "../config/environment.rb"
require "csv"

mapping = {}
Account.transaction do
  CSV.foreach(ARGV[0], headers: true) do |row|
    hash = row.to_hash
    account = Account.new
    account.status = :inactive
    account.name = hash['O_COMPANY']
    account.address1 = hash['O_ADDR1']
    account.address2 = hash['O_ADDR2']
    account.city = hash['O_CITY']
    account.state = hash['O_STATE']
    account.zipcode = hash['O_ZIP']
    account.website = hash['O_WEB']
    if !account.save
      puts account.errors.first
      puts "For record: #{hash}"
      raise ArgumentError
    end
    mapping[hash['ID']] = account.id
  end
end

data = Marshal.dump(mapping)
open('real_estate_mapping', 'wb') { |f| f.puts data }
