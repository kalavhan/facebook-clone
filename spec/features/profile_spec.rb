# frozen_string_literal: true

require 'rails_helper'

RSpec.feature 'Profile', type: :feature do
  before :each do
    @user = User.create(first_name: 'User', last_name:'Smith', email: 'user@mail.com', password: '1234567')
    @post = Post.create(content: 'An awesome post', user_id: @user.id)
  end

  it 'Should visit the profile path' do
    visit root_path
    fill_in 'session[email]', with: 'user@mail.com'
    fill_in 'session[password]', with: '1234567'
    click_button 'Log in'
    click_on 'Profile'
    expect(page).to have_content('User Smith')
    expect(page).to have_content('Bio:')
    expect(page).to have_content('Gender:')
    expect(page).to have_content('Location:')
    expect(page).to have_content('Relationship Status:')
    expect(page).to have_content('An awesome post')
    expect(page).to have_content('comment')
    expect(page).to have_content('thumb_up')
    expect(page).to have_content('Like')
    expect(page).to have_content('User')
    expect(page).to have_content('Update Profile')
  end

  it 'Should edit a user\'s profile' do
    visit root_path
    fill_in 'session[email]', with: 'user@mail.com'
    fill_in 'session[password]', with: '1234567'
    click_button 'Log in'
    click_on 'Profile'
    click_on 'Update Profile'
    fill_in 'user[bio]', with: 'My awesome bio!'
    fill_in 'user[location]', with: 'Barcelona'
    find('#user_gender').select('Male')
    find('#user_status').select('Single')
    click_button 'Update'
    expect(page).to have_content('User Smith')
    expect(page).to have_content('Bio: My awesome bio!')
    expect(page).to have_content('Gender: Male')
    expect(page).to have_content('Location: Barcelona')
    expect(page).to have_content('Relationship Status: Single')
  end
end