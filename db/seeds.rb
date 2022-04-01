# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
# require 'faker'

# addresses, managers and events can be inserted at bulk at the end of the proccess each on a single query.
# this speeds up the process of seeding, going from > 1min to ~ 6 secs.
addresses = []
managers = []
events = []

100.times do
  establishment = Establishment.create!(name: Faker::Company.name, registration_number: Faker::Company.sic_code)
  addresses << {
    address1: Faker::Address.building_number,
    address2: Faker::Address.street_address,
    city: Faker::Address.city,
    state: Faker::Address.state,
    country: Faker::Address.country,
    zip: Faker::Address.zip,
    establishment_id: establishment.id,
    created_at: Time.now,
    updated_at: Time.now
  }

  # create two users per establishment.
  # first of these two will be the manager
  establishment_users = establishment.users.create([
    { firstname: Faker::Name.first_name, lastname: Faker::Name.last_name, email: Faker::Internet.email, phone: Faker::PhoneNumber.cell_phone},
    { firstname: Faker::Name.first_name, lastname: Faker::Name.last_name, email: Faker::Internet.email, phone: Faker::PhoneNumber.cell_phone}
  ])
  managers << {
    user_id: establishment_users.first.id,
    created_at: Time.now,
    updated_at: Time.now
  }

  100.times do
    events << { name: Faker::Game.title, start_at: Faker::Date.forward(days: 23), end_at: Faker::Date.forward(days: 23), establishment_id: establishment.id, created_at: Time.now, updated_at: Time.now }
  end
end
Event.insert_all(events)
Address.insert_all(addresses)
Manager.insert_all(managers)