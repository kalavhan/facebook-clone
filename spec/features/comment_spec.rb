# frozen_string_literal: true

require 'rails_helper'

RSpec.feature 'Posts', type: :feature do
  before :each do
    @user = User.create(first_name: 'User', last_name: 'Smith', email: 'user@mail.com', password: '1234567')
    @post = Post.create(content: 'An awesome post', user_id: @user.id)
  end

  it 'Should create comment' do
    visit root_path
    fill_in 'session[email]', with: 'user@mail.com'
    fill_in 'session[password]', with: '1234567'
    click_button 'Log in'
    click_on 'comment'
    expect(page).to have_content('User')
    fill_in 'comment[content]', with: 'First comment'
    click_on 'Create comment'
    expect(page).to have_content('1 comment')
  end
end
