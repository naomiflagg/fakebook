require 'rails_helper'

RSpec.describe "StaticPages", type: :request do
  describe 'Home page' do
    it "should have the content 'My Fakebook'" do
      get static_pages_home_url
      expect(page).to have_content('My Fakebook')
    end
  end
end
