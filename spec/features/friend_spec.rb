# frozen_string_literal: true

require 'rails_helper'

RSpec.feature 'Posts', type: :feature do
  before :each do
    @user = User.create(first_name: 'User', last_name: 'Smith', email: 'user@mail.com', password: '1234567')
    @user = User.create(first_name: 'Tony', last_name: 'Stark', email: 'tony@mail.com', password: '1234567')
  end

  it 'Should see list of users to add as frineds' do
    visit root_path
    fill_in 'session[email]', with: 'user@mail.com'
    fill_in 'session[password]', with: '1234567'
    click_button 'Log in'
    click_on 'Find Friends'
    expect(page).to have_content('Tony Stark')
  end

  it 'Should be able to add a new friend' do
    visit root_path
    fill_in 'session[email]', with: 'user@mail.com'
    fill_in 'session[password]', with: '1234567'
    click_button 'Log in'
    click_on 'Find Friends'
    click_on 'Add Friend'
    expect(page).to have_content('Pending')
  end

  it 'Should be able to accept a request' do
    visit root_path
    fill_in 'session[email]', with: 'user@mail.com'
    fill_in 'session[password]', with: '1234567'
    click_button 'Log in'
    click_on 'Find Friends'
    click_on 'Add Friend'
    click_on 'Log out'
    fill_in 'session[email]', with: 'tony@mail.com'
    fill_in 'session[password]', with: '1234567'
    click_button 'Log in'
    click_on 'notification'
    click_on 'Accept'
    expect(page).to have_content('No Pending Requests')
  end

  it 'Should be able to reject a request' do
    visit root_path
    fill_in 'session[email]', with: 'user@mail.com'
    fill_in 'session[password]', with: '1234567'
    click_button 'Log in'
    click_on 'Find Friends'
    click_on 'Add Friend'
    click_on 'Log out'
    fill_in 'session[email]', with: 'tony@mail.com'
    fill_in 'session[password]', with: '1234567'
    click_button 'Log in'
    click_on 'notification'
    click_on 'Reject'
    expect(page).to have_content('No Pending Requests')
  end
end
