# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Emanuel', :city => cities.first)


3.times do |account_number|
  a = Account.create(
      :name => "Test Account #{account_number}",
      :status_value => account_number,
      :address1 => Faker::Address.street_address,
      :address2 => Faker::Address.secondary_address,
      :city => Faker::Address.city,
      :state => Faker::Address.state_abbr,
      :zipcode => Faker::Address.zip_code,
      :email => Faker::Internet.email,
      :website => Faker::Internet.domain_name

  )

  4.times do |user_number|
    a.users.create(
        :email => "test_#{account_number}_#{user_number}@email.com",
        :password => '111111',
        :password_confirmation => '111111',
        :title => Faker::Name.prefix,
        :first_name => Faker::Name.first_name,
        :last_name => Faker::Name.last_name,
        :role_value => user_number
    )
  end
end