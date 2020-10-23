class User < ApplicationRecord
  validates_presence_of :first_name, :last_name
  
  has_one :profile, dependent: :destroy
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
end
