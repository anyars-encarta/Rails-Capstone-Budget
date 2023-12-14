require 'rails_helper'

RSpec.feature 'Welcome Page', type: :feature do
  scenario 'User sees the welcome message and login/signup options' do
    visit root_path

    expect(page).to have_css('.welcome-container')

    within('.welcome-container') do
      expect(page).to have_css('h1.fade-in', text: 'Welcome to e-budget!')
      expect(page).to have_link('LOG IN', href: new_user_session_path)
      expect(page).to have_link('SIGN UP', href: new_user_registration_path)
    end
  end
end
