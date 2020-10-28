class FriendRequest < ApplicationRecord
  validates_uniqueness_of :friender_id, scope: :friended_id
  validates_presence_of :friender_id, :friended_id
  
  belongs_to :friender, class_name: 'User'
  belongs_to :friended, class_name: 'User'
end
