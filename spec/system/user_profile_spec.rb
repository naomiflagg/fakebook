require 'rails_helper'

RSpec.describe 'UserProfile', type: :system do
  let(:user) do
    User.create(
      first_name: 'First',
      last_name: 'Last',
      email: 'first.last@example.com',
      password: password,
      password_confirmation: password,
  )
  end
  
  let(:password) { Devise.friendly_token }
  
  before { sign_in user }
  
  describe 'creating a profile' do
    before do 
      visit root_path
      click_on 'Create my profile'
      fill_in 'Location', with: 'London'
      click_on 'Create Profile'
    end

    it 'redirects to user profile' do
      expect(page).to have_current_path(user_path(user))
      expect(page).to have_content('About First Last')
    end

    it 'fills in profile with form inputs' do
      expect(page).to have_content('London')
    end
  end

  describe 'updating a profile' do
    before do 
      user.create_profile(location: 'Indiana')
      visit root_path
      click_on 'Edit my profile'
      fill_in 'Location', with: 'Mars'
      click_on 'Update Profile'
    end

    it 'redirects to user profile' do
      expect(page).to have_current_path(user_path(user))
    end

    it 'updates profile with form inputs' do
      expect(page).to have_content('Mars')
    end
  end
  
  describe 'destroying a profile' do
    let(:create_and_destroy) do
      user.create_profile(location: 'Indiana')
      visit user_path(user)
      accept_confirm do
        click_on 'Delete profile'
      end
    end

    it 'destroys profile' do
      expect{ create_and_destroy }.to change{ Profile.count }.by(1)
    end

    it "reintroduces 'create my profile' link" do
      create_and_destroy
      expect(page).to have_content('Create my profile')
    end
  end
end
