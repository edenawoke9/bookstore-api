# db/seeds.rb

# Create Categories
Category.create([{ name: "Fiction" }, { name: "Non-Fiction" }])

# Create Admin User
User.create!(
  name: "Admin",
  email: "admin@bookstore.com",
  password: "password",
  password_confirmation: "password",
  role: "admin"
)