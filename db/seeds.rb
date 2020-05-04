# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'

100.times do 
    User.create(name: Faker::Name.name, username: Faker::Name.initials, zipcode: Faker::Address.zip)
    City.create(city_name: Faker::Address.city, state_name: Faker::Address.state, zipcode: Faker::Address.postcode)
    Town.create(name: Faker::Address.community, city_id: rand(0..99))
    
end