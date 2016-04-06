require 'rails_helper'

feature "user views a parks show page" do
  scenario "user views a park with 3 reviews" do
    first_park = FactoryGirl.create(:park)
    first_review = FactoryGirl.create(:review, park: first_park)
    second_review = FactoryGirl.create(:review, park: first_park)
    third_review = FactoryGirl.create(:review, park: first_park)

    visit "/"
    click_link first_park.name
    expect(page).to have_content(first_park.name)
    expect(page).to have_content(first_park.rating)
    expect(page).to have_content(first_park.description)
    expect(page).to have_content(first_review.body)
    expect(page).to have_content(second_review.body)
    expect(page).to have_content(third_review.body)
    expect(page).to have_content(first_review.rating)
  end
end
