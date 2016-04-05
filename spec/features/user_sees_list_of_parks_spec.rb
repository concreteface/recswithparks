require 'rails_helper'

feature "user sees all the parks" do
  scenario "unauthenticated user visits index" do
    first_park = FactoryGirl.create(:park)
    second_park = FactoryGirl.create(:park)
    third_park = FactoryGirl.create(:park)

    visit "/"

    expect(page).to have_content(first_park.name)
    expect(page).to have_content(second_park.name)
    expect(page).to have_content(third_park.name)
  end

  scenario "authenticated user visits index" do
    user_1 = FactoryGirl.create(:user)
    login_as(user_1)
    first_park = FactoryGirl.create(:park)
    second_park = FactoryGirl.create(:park)
    third_park = FactoryGirl.create(:park)

    visit "/"

    expect(page).to have_content(first_park.name)
    expect(page).to have_content(second_park.name)
    expect(page).to have_content(third_park.name)
  end
end
