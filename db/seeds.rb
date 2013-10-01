# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.create!(email: "john@email.com", password: "password", password_confirmation: "password")
User.create!(email: "jp@email.com", password: "password", password_confirmation: "password")

20.times do |i|
  Entry.create(
    title: Faker::Company.catch_phrase,
    post: Faker::Lorem.paragraphs(paragraph_count = 3).join.to_s,
    date_posted: (30.days.ago + i.day),
    user_id: "1"
  )
end

22.times do |i|
  Entry.create(
    title: Faker::Company.catch_phrase,
    post: Faker::Lorem.paragraphs(paragraph_count = 3).join.to_s,
    date_posted: (30.days.ago + i.day),
    user_id: "2"
  )
end
