# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'new user registration page', type: :feature do
  it 'has a form to create a new user then sends user to show page' do
    visit register_path

    fill_in :name, with: 'Sally'
    fill_in :email, with: 'sally@turing.com'
    fill_in 'Password', with: 'password123' 
    fill_in 'Password Confirmation', with: 'password123'

    click_button 'Register New User'

    expect(current_path).to eq(user_path(User.last.id))
  end

  it 'takes user back to reg page if they have mismatching/blank passwords' do
    visit register_path

    fill_in :name, with: 'Sally'
    fill_in :email, with: 'sally@turing.com'
    fill_in 'Password', with: '' 
    fill_in 'Password Confirmation', with: ''
    click_button 'Register New User'

    expect(current_path).to eq(register_path)
    expect(page).to have_content "Error: Mismatching passwords"

    
    fill_in :name, with: 'Sally'
    fill_in :email, with: 'sally@turing.com'
    fill_in 'Password', with: '' 
    fill_in 'Password Confirmation', with: ''
    click_button 'Register New User'

    expect(current_path).to eq(register_path)
    expect(page).to have_content "Error: Blank password"
  end
end
