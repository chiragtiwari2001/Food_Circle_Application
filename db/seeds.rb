# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

User.create!(username: "User example",
              email: "user@example.com",
              password: "foobar",
              address: "example-140-A",
              confirmed_at: Time.now ).add_role :admin

10.time do |n|
  name = Faker::Name.name
  email = "example-#{n+1}@user.in"
  password = "password"
  address = "example-#{n+1}-A"

  User.create!(username: name,
                email: email,
                address: address,
                password: password,
                confirmed_at: Time.now ).add_role :member

end

category = Category.create!(category_name: "North Indain")

category.foods.create!(food_name: "Chole Bhature", price: 150)
category.foods.create!(food_name: "Chole Kulche", price: 170)
