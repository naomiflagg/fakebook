# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
require 'faker'

# Create users
# 99.times do |n|
#   first_name = Faker::Name.first_name
#   last_name = Faker::Name.last_name
#   email = "example-#{n+1}@rexample.com"
#   password = 'password55'
#   User.create!(first_name: first_name,
#                last_name: last_name,
#                email: email,
#                password: password,
#                password_confirmation: password)
# end

users = User.all

# Create friend requests
# FriendRequest.destroy_all
# 80.times do
#   friended = users.sample
#   friender = users.sample
#   friended.sent_request?(friender) || friended == friender || friender.sent_requests.create(friended_id: friended.id)
# end

# Create friendships
# Friendship.destroy_all
# requests = FriendRequest.all
# 20.times do
#   random_request = requests.sample
#   user1id = random_request.friended_id
#   user2id = random_request.friender_id
#   Friendship.where('friend_id = ?', user1id).exists? || Friendship.create(user_id: user1id, friend_id: user2id)
#   random_request.destroy
# end

# Post.destroy_all
# 200.times do
#   user = users.sample
#   text = Faker::Quote.famous_last_words
#   user.posts.create(body: text)
# end

posts = Post.all

# Comment.destroy_all
# 200.times do
#   post = posts.sample
#   user = users.sample
#   text = Faker::Quote.famous_last_words
#   post.comments.create(body: text, user_id: user.id)
# end

Like.destroy_all
200.times do
  post = posts.sample
  user = users.sample
  post.likes.create(user_id: user.id)
end