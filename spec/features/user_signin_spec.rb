require 'rails_helper'

RSpec.feature "UserSignins", type: :feature, js: true do
  it 'requires a user to sign in' do
    visit '/'
    expect(page).to have_text('You need to sign in')
    expect(current_path).to eq('/users/sign_in')
  end
  it 'validates user credentials' do
    visit '/'
    within("form") do
      fill_in 'Email', with: 'bob@test.net'
      fill_in 'Password', with: 'Password1234!'
    end
    click_button 'Sign in'
    expect(page).to have_content 'Invalid Email or password'
  end
  it 'grant access to valid users' do
    user = Fabricate(:user, email: 'bob@test.net', password: 'Password!1234', password_confirmation: 'Password!1234')
    visit '/'
    within("form") do
      fill_in 'Email', with: 'bob@test.net'
      fill_in 'Password', with: 'Password!1234'
    end
    click_button 'Sign in'
    expect(page).to have_content 'Welcome bob@test.net'
  end
end
