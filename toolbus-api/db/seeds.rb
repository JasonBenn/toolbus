# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.destroy_all

User.create(
  username: 'JasonBenn',
  image_url: 'https://avatars1.githubusercontent.com/u/2539761?v=3&s=460'
)

5.times do |n|
  User.create(
    username: Faker::Internet.user_name,
    image_url: Faker::Avatar.image
  )
end