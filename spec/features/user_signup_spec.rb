require 'rails_helper'
RSpec.describe 'signup page', type: :feature do
  scenario 'signup page' do
    visit new_user_path
    fill_in 'user_username', with: 'Greg'
    click_button 'sign up'
    expect(page).to have_content('Greg')
  end
end
