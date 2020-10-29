require 'rails_helper'

RSpec.describe 'UserSignIn', type: :system do
  before do
    User.create(
    first_name: 'First',
    last_name: 'Last',
    email: 'first.last@example.com',
    password: password,
    password_confirmation: password
  )
  end 
  
  let(:password) { Devise.friendly_token }

  context 'when a user signs in' do
    it 'redirects to the homepage' do
      visit root_path
      fill_in 'Email', with: 'first.last@example.com'
      fill_in 'Password', with: password

      click_on 'Log in'

      expect(page).to have_current_path(root_path)
      expect(page).to have_content('My Fakebook')
    end
  end

  context "when validations don't pass" do
    it 'does not redirect to the homepage' do
      visit root_path
      fill_in 'Email', with: ''
      fill_in 'Password', with: 'foobar'

      click_on 'Log in'

      expect(page).to_not have_current_path(root_path)
    end
  end
end