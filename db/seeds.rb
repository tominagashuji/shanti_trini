# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

5.times do |n|
  name = Faker::Name.unique.name
  email = Faker::Internet.unique.email
  password = "password"
  # image = Faker::Avatar.image
  random = Random.new

  user = User.new(name: name,
               email: email,
               password: password,
               password_confirmation: password)
  user.image = open "#{Rails.root}/app/assets/images/simarin#{random.rand(1..5)}.jpeg"
  user.save
end
