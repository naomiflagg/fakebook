class FriendRequest < ApplicationRecord
  belongs_to :user
  belongs_to :friended, class_name: 'User'

  validates_uniqueness_of :user_id, scope: :friended_id

  after_update :create_inverse
  
  scope :accepted, -> { where(accepted: true) }
  scope :pending, -> { where(accepted: false) }

  def create_inverse
    self.class.create(user_id: friended.id, friended_id: user.id, accepted: true)
  end
end
