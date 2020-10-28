require 'rails_helper'

RSpec.describe Comment, type: :model do
  subject(:comment) do
    described_class.create(
      body: 'Comment body',
      user_id: 5,
      post_id: 2
    )
  end

  describe 'validations' do
    it { should validate_presence_of(:body) }
    it { should validate_presence_of(:user_id) }
    it { should validate_presence_of(:post_id) }
  end

  describe 'associations' do
    it { should belong_to(:user) }
    it { should belong_to(:post) }
  end
end
