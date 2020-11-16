require 'rails_helper'

RSpec.describe 'Creating an event', type: :feature do
  let(:user) { User.create(username: 'Maggie') }

  before(:each) do
    visit login_path
    fill_in 'session_username', with: user.username
    click_button 'sign in'
    expect(page).to have_content('Logged in!')
  end

  scenario 'valid inputs' do
    visit new_event_path
    fill_in 'event_date', with: Date.today
    fill_in 'event_title', with: 'Meeting'
    fill_in 'event_location', with: 'Cameroon'
    fill_in 'event_description', with: 'another meeting'
    click_button 'Create Event'
    visit root_path
    expect(page).to have_content(Date.today)
    expect(page).to have_content('Meeting')
    expect(page).to have_content('Cameroon')
    expect(page).to have_content('another meeting')
  end

  scenario 'invalid inputs' do
    visit new_event_path
    fill_in 'event_date', with: ''
    fill_in 'event_title', with: ''
    fill_in 'event_location', with: ''
    fill_in 'event_description', with: ''
    click_button 'Create Event'
    expect(page).to have_content("Date can't be blank")
    expect(page).to have_content("Title can't be blank")
    expect(page).to have_content("Location can't be blank")
    expect(page).to have_content("Description can't be blank")
  end
end
