# frozen_string_literal: true

require 'rails_helper'

RSpec.feature 'Posts', type: :feature do
  before :each do
    @user = User.create(first_name: 'User', last_name:'Smith', email: 'user@mail.com', password: '1234567')
    @post = Post.create(content: 'An awesome post', user_id: @user.id)
  end

  it 'Should create a post' do
    visit root_path
    fill_in 'session[email]', with: 'user@mail.com'
    fill_in 'session[password]', with: '1234567'
    click_button 'Log in'
    fill_in 'post[content]', with: 'This is a post content'
    click_on 'Create post'
    expect(page).to have_content('This is a post content')
    expect(page).to have_content('comment')
    expect(page).to have_content('thumb_up')
    expect(page).to have_content('Like')
    expect(page).to have_content('User')
  end

  # it 'Should show the event show page' do
  #   visit login_path
  #   fill_in 'session[email]', with: 'user@mail.com'
  #   click_button 'Sign In'
  #   expect(page).to have_content('Welcome, User')
  #   expect(page).to have_content('Upcoming Events')
  #   expect(page).to have_content('Previous Events')
  #   click_on 'New event'
  #   expect(page).to have_content('Location')
  #   fill_in 'event[location]', with: 'Taco bell'
  #   fill_in 'event[description]', with: 'Meeting to eat some tacos'
  #   fill_in 'event[date]', with: '2020-02-23'
  #   find('#event_attendees').select('Otto')
  #   click_button 'Create event'
  #   expect(page).to have_content('Welcome, User')
  #   expect(page).to have_content('Upcoming Events')
  #   expect(page).to have_content('Previous Events')
  #   click_on 'All events'
  #   click_on 'view'
  #   expect(page).to have_content('Taco bell')
  # end
end