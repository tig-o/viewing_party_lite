# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'new user registration page', type: :feature do
  it 'has a form to create a new user then sends user to show page' do
    visit register_path

    fill_in 'Name', with: ''
    fill_in 'Email', with: '111'
    click_button 'Register User'
    expect(current_path).to eq '/register'
    expect(page).to have_content 'Error'

    fill_in :name, with: 'Sally'
    fill_in :email, with: 'sally@turing.com'
    fill_in 'Password', with: 'password123' 
    fill_in 'Password Confirmation', with: 'password123'

    click_button 'Register New User'

    expect(current_path).to eq(user_path(User.last.id))
  end
end
