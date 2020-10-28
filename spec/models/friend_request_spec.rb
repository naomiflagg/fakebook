require 'rails_helper'

RSpec.describe FriendRequest, type: :model do
  subject do
    described_class.create(
      friender_id: 5,
      friended_id: 2
    )
  end

  describe 'validations' do
    it { should validate_presence_of(:friender_id) }
    it { should validate_presence_of(:friended_id) }
  end

  describe 'associations' do
    it { should belong_to(:friender).class_name('User') }
    it { should belong_to(:friended).class_name('User') }
  end
end