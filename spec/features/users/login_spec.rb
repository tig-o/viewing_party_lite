require 'rails_helper' 

RSpec.describe 'Log In', type: :feature do 
  it 'can log in' do 
    user = User.create!(name: 'sally', email: 'sally@turing.com', password: '123pw')

    visit root_path 

    fill_in :email, with: user.email 
    fill_in :password, with: user.password

    click_on 'Log In' 

    expect(current_path).to eq(user_path(user))
  end
end