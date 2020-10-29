require 'rails_helper'

RSpec.describe Friendship, type: :model do
  subject(:friendship) do
    described_class.create(
      user_id: 5,
      friend_id: 2
    )
  end

  let(:inverse_friendship) { Friendship.where(user_id: 2, friend_id: 5) }

  describe 'validations' do
    it { should validate_presence_of(:user_id) }
    it { should validate_presence_of(:friend_id) }
  end

  describe 'associations' do
    it { should belong_to(:user) }
    it { should belong_to(:friend).class_name('User') }
  end

  #   describe '#create_inverse' do
  #     it 'creates an inverse friendship' do
  #       expect(inverse_friendship).to exist
  #     end
  #   end

  #   describe '#has_inverse?' do
  #     context 'when an inverse exists' do
  #       it 'returns true' do
  #         expect(friendship.has_inverse?).to be true
  #       end
  #     end
  #   end

  #   describe '#inverses' do
  #     it 'returns the inverse friendship' do
  #       expect(friendship.inverses).to eq(inverse_friendship)
  #     end
  #   end

  #   describe '#destroy_inverses' do
  #     it 'destroys the inverse friendship' do
  #       friendship.destroy_inverses
  #       expect(inverse_friendship).to_not exist
  #     end
  #   end
  # end   
end
