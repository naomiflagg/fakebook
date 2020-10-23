class FriendRequest < ApplicationRecord
  belongs_to :friender, class_name: 'User'
  belongs_to :friended, class_name: 'User'

  validates_uniqueness_of :friender_id, scope: :friended_id
end
