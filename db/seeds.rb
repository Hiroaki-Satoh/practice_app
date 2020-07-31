# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create!(
  name: "John",
  email: "mail1@example",
  password: "password",
  profile_image: open("./app/assets/images/user_profile1.jpg"),
  introduction: "Hi! I'm John!!"
)

User.create!(
  name: "Alice",
  email: "mail2@example",
  password: "password",
  profile_image: open("./app/assets/images/user_profile2.jpg"),
  introduction: "Hi! I'm Alice!!"
)

User.create!(
  name: "Test_user",
  email: "mail3@example",
  password: "password",
  profile_image: open("./app/assets/images/user_profile3.png"),
  introduction: "Test User"
)
