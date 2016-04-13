require "rails_helper"

feature "add review" do
  before(:each) do
    clear_users
    @user = FactoryGirl.create(:user)
    @park = FactoryGirl.create(:park)
    @review = FactoryGirl.create(:review, park: @park, user: @user, rating: 2)
  end

  scenario "user visits park show page and can add review" do
    login_as(@user)

    visit park_path(@park)

    select(5, from: 'Rating')
    fill_in 'Body', with: "Great park. Love it."
    click_button 'Add Review'

    expect(page).to have_content('Your review has been added successfully.')
    expect(page).to have_content('Great park')
    expect(page).to have_content(5)
    expect(page).to have_content(3.5)
  end

  scenario 'user enter invalid form' do
    login_as(@user)

    visit park_path(@park)

    select(5, from: 'Rating')

    click_button 'Add Review'

    expect(page).to have_content("Body can't be blank")
  end
end
