class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one :profile, dependent: :destroy
  has_many :friendships
  has_many :friends, through: :friendships

  validates_presence_of :first_name, :last_name

  def name
    "#{first_name} #{last_name}"
  end
end
