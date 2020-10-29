require 'rails_helper'

RSpec.describe 'UserSignUp', type: :system do
  context 'when a new user signs up' do
    let(:sign_up) do
      password = 'foobar'

      visit root_path
      click_on 'Sign up'
      fill_in 'Email', with: 'first_name@example.com'
      fill_in 'First name', with: 'First'
      fill_in 'Last name', with: 'Last'
      fill_in 'Password', with: password
      fill_in 'Password confirmation', with: password
      click_on 'Sign up'
    end

    it 'redirects to the homepage' do
      sign_up
      expect(page).to have_current_path(root_path)
      expect(page).to have_content('My Fakebook')
    end

    it 'adds a new user to the database' do
      expect{ sign_up }.to change{ User.count }.by(1)
    end

    it 'sends user a welcome email' do
      expect{ sign_up }.to change{ ActionMailer::Base.deliveries.count }.by(1)
    end
  end

  context "when validations don't pass" do
    it 'does not redirect to the homepage' do
      visit root_path
      click_on 'Sign up'
      fill_in 'Email', with: ''
      fill_in 'Password', with: 'foobar'
      fill_in 'Password confirmation', with: 'barfoo'

      click_on 'Sign up'

      expect(page).to_not have_current_path(root_path)
    end
  end
end