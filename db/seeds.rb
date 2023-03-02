# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

puts "Creating users..."
10.times do
  User.create!(
    name: Faker::Name.name,
    email: Faker::Internet.email,
    password: 'password'
  )
end

puts "Creating slots..."
programming_languages = %w[
  C# C++ CoffeeScript CSS Dart DM Elixir Go Groovy HTML Java JavaScript Kotlin Objective-C Perl PHP PowerShell Python
  Ruby Rust Scala Shell Swift TypeScript
]
20.times do
  user = User.order("RANDOM()").first
  Slot.create!(
    user_id: user.id,
    price: rand(200..1000),
    programming_language: programming_languages.sample,
    start_date: Faker::Date.between(from: '2023-01-01', to: '2023-06-30'),
    end_date: Faker::Date.between(from: '2023-07-01', to: '2023-12-31'),
    start_time: Faker::Time.between(from: '8:00 AM', to: '6:00 PM'),
    end_time: Faker::Time.between(from: '8:00 AM', to: '8:00 PM')
  )
end

puts "Finished!"
