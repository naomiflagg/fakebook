class User < ApplicationRecord
  validates_presence_of :first_name, :last_name
  
  has_one :profile, dependent: :destroy
  has_many :posts, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy
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
         :recoverable, :rememberable, :validatable, 
         :omniauthable, omniauth_providers: %i[facebook]

  def name
    "#{first_name} #{last_name}"
  end

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email = auth.info.email
      user.password = Devise.friendly_token[0, 20]
      user.first_name = auth.info.name.split(' ')[0]
      user.last_name = auth.info.name.split(' ')[1]
    end
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
    elsif self == other_user
      'self'
    end
  end

  def post_like(post)
    likes.find_by_post_id(post.id)
  end

  def friends_posts
    Post.where('user_id IN (:friends)', friends: friends.select(:id))
  end
end
