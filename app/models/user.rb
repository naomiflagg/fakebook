class User < ApplicationRecord
  validates_presence_of :first_name, :last_name
  
  has_one :profile, dependent: :destroy
  has_many :posts, dependent: :destroy
  has_many :sent_requests, foreign_key: :friender_id, 
                           class_name: 'FriendRequest',
                           dependent: :destroy
  has_many :friended_users, through: :sent_requests, source: :friended
  has_many :received_requests, foreign_key: :friended_id,
                               class_name: 'FriendRequest',
                               dependent: :destroy
  has_many :frienders, through: :received_requests
  has_many :friendships, dependent: :destroy
  has_many :friends, through: :friendships

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  def name
    "#{first_name} #{last_name}"
  end

  def sent_request?(other_user)
    sent_requests.find_by_friended_id(other_user.id)
  end

  def received_request?(other_user)
    received_requests.find_by_friender_id(other_user.id)
  end

  def friends?(other_user)
    friendships.find_by_friend_id(other_user.id)
  end

  def describe_relationship(other_user)
    if friends?(other_user)
      'friend'
    elsif sent_request?(other_user)
      'friender'
    elsif received_request?(other_user)
      'friended'
    end
  end

  def friends_posts
    posts = []
    friends.each do |f|
      posts << f.posts.to_a
    end
  end
end
