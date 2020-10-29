class Profile < ApplicationRecord
  validates_presence_of :user_id
  validate :acceptable_photo

  belongs_to :user
  has_one_attached :photo

  def acceptable_photo
    return unless photo.attached?

    unless photo.byte_size <= 1.megabyte
      errors.add(:photo, 'is too big')
    end

    acceptable_types = ['image/jpeg', 'image/png']
    unless acceptable_types.include?(photo.content_type)
      errors.add(:main_image, 'must be a JPEG or PNG')
    end
  end
end
