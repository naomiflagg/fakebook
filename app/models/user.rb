class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one :profile, dependent: :destroy
  has_many :friend_requests, dependent: :destroy
  has_many :friended, through: :friend_requests

  validates_presence_of :first_name, :last_name

  def name
    "#{first_name} #{last_name}"
  end

  def friend_requested
    FriendRequest.where('friended_id = ?', id).where(accepted: false)
  end

  def friends
    User.find(friend_requests.accepted.pluck(:friended_id))
  end

  def pending_friends
    User.find(friend_requests.pending.pluck(:friended_id))
  end
end
