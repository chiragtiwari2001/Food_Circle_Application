# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

admin_user = User.new(
  username: 'Admin User',
  email: 'admin@example.com',
  password: 'admin_password',
  password_confirmation: 'admin_password',
  address: 'Admin Address'
)

admin_user.skip_confirmation!
admin_user.add_role :admin
admin_user.save

5.times do |n|
  user = User.new(
    username: "User#{n+1}",
    email: "user#{n+1}@example.com",
    password: 'password',
    password_confirmation: 'password',
    address: "Address#{n+1}"
  )
  user.skip_confirmation!
  user.save
end

category = Category.create!(category_name: "North Indain")
category_image_path = Rails.root.join("tmp\test.jpg")
category.category_image.attach()

category.foods.create!(food_name: "Chole Bhature", price: 150)
category.foods.create!(food_name: "Chole Kulche", price: 170)
