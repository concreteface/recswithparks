require 'rails_helper'

feature 'authenticated user is able to up/downvote a review', js: true do

  before(:each) do
    clear_users
    @park = FactoryGirl.create(:park)
    @user = FactoryGirl.create(:user)
    @first_review = FactoryGirl.create(:review, park: @park, user: @user)
    @second_review = FactoryGirl.create(:review, park: @park, user: @user)
  end

  scenario 'authenticated user can upvote a review' do
    login_as(@user)
    visit "/parks/#{@park.id}"
    within("\#vote-for-#{@first_review.id}") do
      expect(page).to have_content(0)

      expect_no_page_reload do
        click_link "Upvote"
        expect(page).to have_content(1)
        click_link "Downvote"
        expect(page).to have_content(0)
      end
      click_link "Downvote"
      # binding.pry
      expect(page).to have_content(0)
    end
  end
end
