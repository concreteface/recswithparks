require 'rails_helper'

feature 'user sees profile page' do
  before (:each) do
    @user_1 = FactoryGirl.create(:user)
    @review_1 = FactoryGirl.create(:review, user: @user_1)
    @review_2 = FactoryGirl.create(:review, user: @user_1)
  end

  scenario 'user visits index page' do
    login_as(@user_1)
    visit '/'
    within('div.top-bar-right') do
      click_link(@user_1.email)
    end
    expect(page).to have_css("img[src*='#{@user_1.avatar.url}']")
    expect(page).to have_content(@user_1.reviews.first.body)
    expect(page).to have_content(@user_1.reviews.second.body)
    expect(page).to have_content(@user_1.reviews.first.park.name)
    expect(page).to have_content(@user_1.reviews.second.park.name)
  end
end
