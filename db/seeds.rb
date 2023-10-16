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

outlet = Restaurant.create(
                    restaurant_name: "Eaxmple Outlet",
                    restaurant_details: "a place to eat",
                    restaurant_address: "example-A",
                    restaurant_email: "admin@example.com",
                    restaurant_contact: 1234567890
                    )

outlet_image_path = Rails.root.join("tmp", "test.jpg")
outlet.restaurant_image.attach(io: File.open(outlet_image_path), filename: 'test.jpg')

category = Category.create!(category_name: "Fast Food")

category_image_path = Rails.root.join("tmp", "test.jpg")
category.category_image.attach(io: File.open(category_image_path), filename: 'test.jpg')

food1 = category.foods.create!(food_name: "Burger", price: 150)
food2 = category.foods.create!(food_name: "French Fries", price: 170)



RestaurantCategory.create(restaurant_id: outlet, category_id: category)

RestaurantFood.create(restaurant_id: outlet, food_id: food1)
RestaurantFood.create(restaurant_id: outlet, food_id: food2)