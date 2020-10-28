require 'rails_helper'

RSpec.describe User, type: :model do
  subject(:user) do
    described_class.create(
      first_name: 'First',
      last_name: 'Last',
      email: 'first.last@example.com',
      password: password,
      password_confirmation: password
    )
  end

  let(:other_user) do
    described_class.create(
      first_name: 'Other',
      last_name: 'User',
      email: 'other_user@example.com',
      password: password,
      password_confirmation: password
    )
  end

  let(:password) { Devise.friendly_token }
  
  describe 'validations' do
    it { should validate_presence_of(:first_name) }
    it { should validate_presence_of(:last_name) }
  end

  describe 'associations' do 
    it { should have_many(:posts) }
    it { should have_many(:comments) }
    it { should have_many(:likes) }
    it { should have_many(:sent_requests).class_name('FriendRequest') }
    it { should have_many(:friended_users).class_name('User') }
    it { should have_many(:received_requests).class_name('FriendRequest') }
    it { should have_many(:frienders).class_name('User') }
    it { should have_many(:friendships).class_name('Friendship') }
    it { should have_many(:friends).class_name('User') }
  end

  describe 'friend requests' do
    describe '#sent_request?' do
      context 'when the user has sent a request' do
        it 'returns a request' do
          FriendRequest.create(friender: user, friended: other_user)
          expect(user.sent_request?(other_user)).to be_truthy
        end
      end

      context 'when the user has not sent a request' do
        it 'returns nil' do
          expect(other_user.sent_request?(user)).to be_nil
        end
      end
    end

    describe '#received_request?' do
      context 'when the user has received a request' do
        it 'returns a request' do
          FriendRequest.create(friender: user, friended: other_user)
          expect(other_user.received_request?(user)).to be_truthy
        end
      end

      context 'when the user has not received a request' do
        it 'returns nil' do
          expect(user.received_request?(other_user)).to be_nil
        end
      end
    end
  end

  describe '#friends?' do
    context 'when the users are friends' do
      it 'returns a friendship' do
        Friendship.create(user: user, friend: other_user)
        expect(user.friends?(other_user)).to be_truthy
      end

      it 'shows users as friends' do
        Friendship.create(user: user, friend: other_user)
        expect(user.friends).to include(other_user)
      end
    end
    
    context 'when the users are not friends' do
      it 'returns nil' do
        expect(user.friends?(other_user)).to be_nil
      end
    end
  end
end