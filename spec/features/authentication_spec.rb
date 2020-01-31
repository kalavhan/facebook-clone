# frozen_string_literal: true

require 'rails_helper'

RSpec.feature 'Authentications', type: :feature do
  before :each do
    @user = User.create(first_name: 'User', last_name: 'Smith', email: 'user@mail.com', password: '1234567')
  end

  it 'Should Signup' do
    visit root_path
    fill_in 'user[first_name]', with: 'Jhon'
    fill_in 'user[last_name]', with: 'Smith'
    fill_in 'user[email]', with: 'jhon@mail.com'
    fill_in 'user[password]', with: '1234567'
    fill_in 'user[password_confirmation]', with: '1234567'
    click_button 'Sign up'
    expect(page).to have_content('Fakebook')
    expect(page).to have_content('Home')
    expect(page).to have_content('Profile')
    expect(page).to have_content('Log out')
  end

  it 'Should Signin' do
    visit root_path
    fill_in 'session[email]', with: 'user@mail.com'
    fill_in 'session[password]', with: '1234567'
    click_button 'Log in'
    expect(page).to have_content('Fakebook')
    expect(page).to have_content('Home')
    expect(page).to have_content('Profile')
    expect(page).to have_content('Log out')
  end

  it 'Should Signout' do
    visit root_path
    fill_in 'session[email]', with: 'user@mail.com'
    fill_in 'session[password]', with: '1234567'
    click_button 'Log in'
    expect(page).to have_content('Fakebook')
    expect(page).to have_content('Home')
    expect(page).to have_content('Profile')
    expect(page).to have_content('Log out')
    click_on 'Log out'
    expect(page).to have_content('Create an account')
    expect(page).to have_content("It's quick and easy.")
  end
end
