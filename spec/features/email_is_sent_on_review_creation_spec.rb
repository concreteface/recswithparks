require 'rails_helper'

feature 'email is queued when a review is left' do

  scenario 'authenticated user leaves review' do
    clear_users
    ActionMailer::Base.deliveries.clear
    @park = FactoryGirl.create(:park)
    @user = FactoryGirl.create(:user)
    login_as(@user)

    visit park_path(@park)
    expect(ActionMailer::Base.deliveries.count).to eq(0)
    select(5, from: 'Rating')
    fill_in 'Body', with: "Great park. Love it."
    click_button 'Add Review'

    expect(page).to have_content('Your review has been added successfully.')
    expect(page).to have_content('Great park')
    expect(ActionMailer::Base.deliveries.count).to eq(1)

  end

end
