# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'

100.times do
	establishment = Establishment.create(name: Faker::Company.name, registration_number: Faker::Company.sic_code)
	establishment.create_address(address1: Faker::Address.building_number, address2: Faker::Address.street_address, city: Faker::Address.city, state: Faker::Address.state, country: Faker::Address.country, zip: Faker::Address.zip)
	establishment.users.create(firstname: Faker::Name.first_name, lastname: Faker::Name.last_name, email: Faker::Internet.email, phone: Faker::PhoneNumber.cell_phone)
	100.times do
		establishment.events.create(name: Faker::Game.title, start_at: Faker::Date.forward(days: 23), end_at: Faker::Date.forward(days: 23))
	end
end
  
Establishment.includes(:events).where(events: {status: 'validated'})
Establishment.includes(:events).where.not(events: {status: 'pending'})
