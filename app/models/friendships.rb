class Friendships < ApplicationRecord
  belongs_to :user
  belongs_to :friend, class_name: 'User'

  validates_uniqueness_of :user_id, scope: :friend_id

  after_create :create_inverse

  def create_inverse
    self.class.create(user_id: friend.id, friend_id: user.id)
  end
end
