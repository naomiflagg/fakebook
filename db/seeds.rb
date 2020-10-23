# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
require 'faker'

99.times do |n|
  first_name = Faker::Name.first_name
  last_name = Faker::Name.last_name
  email = "example-#{n+1}@rexample.com"
  password = 'password55'
  User.create!(first_name: first_name,
               last_name: last_name
               email: email,
               password: password,
               password_confirmation: password)
end

def make_requests
  users = User.all
  user  = users.first
  requested_users = users[2..50]
  frienders      = users[3..40]
  requested_users.each { |requested| user.add_friend(requested) }
  frienders.each      { |friender| friender.add_friend(user) }
end
