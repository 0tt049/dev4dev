# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

puts "Cleaning up database..."
Slot.destroy_all
User.destroy_all
puts "Database cleaned"

puts "Creating users..."
15.times do
  User.create!(
    name: Faker::Name.name,
    email: Faker::Internet.email,
    password: 'password'
  )
end

# puts "Creating slots..."
# programming_language = %w[
#   C# C++ CSS HTML Java JavaScript PHP PowerShell Python
#   Ruby Rust TypeScript
# ]

# start_date = Faker::Date.between(from: '2023-04-01', to: '2023-06-30')
# start_time = Faker::Time.between(from: '8:00 AM', to: '6:00 PM')

# 40.times do
#   user = User.order("RANDOM()").first
#   Slot.create!(
#     user_id: user.id,
#     price: rand(200..1000),
#     programming_language: programming_language.sample,
#     start_date: start_date,
#     end_date: start_date + (66*60*24),
#     start_time: start_time,
#     end_time: start_time + (66*60*24)
#   )
# end
  user = User.order("RANDOM()").first
  Slot.create!(
    user_id: user.id,
    price: rand(200..1000),
    programming_language: 'Python',
    start_date: '2023-03-04',
    end_date: '2023-06-30',
    start_time: '8:00 AM',
    end_time: '06:00 PM'
  )

puts "Finished!"
