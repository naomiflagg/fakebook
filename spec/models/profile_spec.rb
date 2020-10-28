require 'rails_helper'

RSpec.describe Profile, type: :model do
  subject(:profile) do
    described_class.create(
      birthday: Time.now,
      location: 'location',
      user_id: 5
    )
  end

  describe 'validations' do
    it { should validate_presence_of(:user_id) }
  end

  describe 'associations' do
    it { should belong_to(:user) }
  end
end