# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
require 'faker'

puts 'nettoyage de la base'
Review.destroy_all
Restaurant.destroy_all
Category.destroy_all

puts 'début création category'
%w[chinese italian japanese french belgian].each do |category|
  Category.create(name: category)
  puts "création category #{category}"
end
10.times do
  Category.create(name: Faker::Restaurant.type)
end
puts 'fin création category'

puts 'début création 10 restaurants'
10.times do
  Restaurant.create(
    name: Faker::Restaurant.name,
    address: Faker::Address.full_address,
    phone_number: Faker::PhoneNumber.cell_phone_with_country_code,
    description: Faker::Restaurant.description,
    category_id: Category.all.sample.id
  )
end
puts 'fin création 10 restaurants'

puts 'début création avis sur les restaurants'
Restaurant.all.each do |restaurant|
  rand(1..6).times do
    Review.create(
      rating: rand(0..5),
      content: Faker::Restaurant.review,
      restaurant_id: restaurant.id
    )
  end
end
puts 'fin création avis sur les restaurants'
puts 'fin du seeds'
