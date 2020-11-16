require 'rails_helper'
RSpec.describe 'login page', type: :feature do
  let(:user) { User.create(username: 'Lovelyn') }

  scenario 'login page' do
    visit login_path
    fill_in 'session_username', with: user.username
    click_button 'sign in'
    expect(page).to have_content('Logged in!')
  end
end
