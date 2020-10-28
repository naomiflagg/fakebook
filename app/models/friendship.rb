class Friendship < ApplicationRecord
  validates_presence_of :user_id, :friend_id
  validates_uniqueness_of :user_id, scope: :friend_id
  
  belongs_to :user
  belongs_to :friend, class_name: 'User'

  after_create :create_inverse, unless: :has_inverse?
  after_destroy :destroy_inverses, if: :has_inverse?

  def create_inverse
    self.class.create(inverse_friend_options)
  end

  def destroy_inverses
    inverses.destroy_all
  end

  def has_inverse?
    self.class.exists?(inverse_friend_options)
  end

  def inverses
    self.class.where(inverse_friend_options)
  end

  def inverse_friend_options
    { friend_id: user_id, user_id: friend_id }
  end
end
