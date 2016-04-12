require 'rails_helper'

feature "admin deletes content", js: true do
  before(:all) do
    clear_users
    clear_parks
    @admin_user = FactoryGirl.create(:user, admin: true)
    @user = FactoryGirl.create(:user)
    @park = FactoryGirl.create(:park)
    @review1 = FactoryGirl.create(:review, park: @park, user: @user)
    @review2 = FactoryGirl.create(:review, park: @park)
  end

  scenario "admin deletes review" do
    login_as(@admin_user)

    visit park_path(@park)
    expect(page).to have_content(@review1.body)
    find("div#review-#{@review1.id}").click
    expect(page).to_not have_content(@review1.body)
    expect(page).to have_content(@review2.body)
  end

  scenario "admin deletes park" do
    login_as(@admin_user)

    visit root_path
    expect(page).to have_content(@park.name)
    find("div#park-#{@park.id}").click
    expect(page).to_not have_content(@park.name)
  end

  scenario "admin deletes user" do
    login_as(@admin_user)

    visit users_path
    expect(page).to have_content(@user.email)
    find("div#user-#{@user.id}").click
    expect(page).to_not have_content(@user.email)
  end 
end
