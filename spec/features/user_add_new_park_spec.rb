require 'rails_helper'

feature "user adds a new park" do

  before(:each) do
    @user = FactoryGirl.create(:user)
  end

  scenario "user gets to new form from index" do
    login_as(@user)
    visit "/"
    click_on "Add New Park"

    expect(page).to have_content("Add New Park")
    fill_in "Name", with: "Evans Way Park"
    fill_in "Address", with: "244 Fenway"
    fill_in "Description", with: "A nice local park for people of all ages."
    click_button "Submit"

    expect(page).to have_content("Evans Way Park")
    expect(page).to have_content("244 Fenway")
    expect(page).to have_content("people of all ages")
  end

  scenario "user submits bad form" do
    login_as(@user)
    visit new_park_path

    fill_in "Description", with: "a park"
    click_button "Submit"

    expect(page).to have_content("Name can't be blank, Street can't be blank, Description is too short (minimum is 20 characters)")
  end

  scenario "unauthenticated user is unable to see the new page" do
    visit "/"
    click_on "Add New Park"

    expect(page).to have_content("You need to sign in or sign up before continuing.")
  end

end
