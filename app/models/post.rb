class Post < ApplicationRecord
  
  validates_presence_of :body, :user_id
  
  belongs_to :user
  has_many :likes, dependent: :destroy
  has_many :comments, dependent: :destroy

end
