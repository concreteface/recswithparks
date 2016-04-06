require 'rails_helper'

#[X]User creates account
#[X]User can sign in
#[X]User can sign out
#[]User can add avatar
#[]User can update information
#[]User can delete account
feature "unauthenticated user can create account" do
  scenario "visit new user page" do
    visit '/users/sign_up'

    expect(page).to have_content('Email')
    fill_in 'Email', with: 'yo@ho.com'
    fill_in 'Password', with: 'password'
    fill_in 'Password confirmation', with: 'password'
    click_button 'Sign up'

    expect(page).to have_content('yo@ho.com')
    expect(page).to have_content('Parks')
    expect(page).not_to have_content('Log in')
    expect(page).not_to have_content('Sign up')
  end
end
