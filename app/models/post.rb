class Post < ApplicationRecord
  validates_presence_of :body
  
  belongs_to :user
  has_many :comments, dependent: :destroy
end
