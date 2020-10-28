require 'rails_helper'

RSpec.describe Post, type: :model do
  subject(:post) do
    described_class.create(
      body: 'Post body',
      user_id: 5
    )
  end

  describe 'validations' do
    it { should validate_presence_of(:body) }
    it { should validate_presence_of(:user_id) }
  end

  describe 'associations' do
    it { should belong_to(:user) }
    it { should have_many(:likes) }
    it { should have_many(:comments) }
  end
end
