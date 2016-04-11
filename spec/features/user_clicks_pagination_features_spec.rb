require 'rails_helper'

feature "user click paginated links" do

  before(:all) do
    clear_users
    clear_parks
    @sample_park = "Boston Public Garden "
    FactoryGirl.reload
    FactoryGirl.create_list(:park, 40)
  end

  scenario "user clicks next link" do
    visit "/"

    expect(page).to have_content(@sample_park + 3.to_s)
    expect(page).to have_content(@sample_park + 7.to_s)
    expect(page).to_not have_content(@sample_park + 15.to_s)

    click_on "Next ›"

    expect(page).to have_content(@sample_park + 15.to_s)
    expect(page).to_not have_content(@sample_park + 3.to_s)
    expect(page).to_not have_content(@sample_park + 7.to_s)
  end

  scenario "user clicks previous link" do
    visit "/?page=2"

    expect(page).to have_content(@sample_park + 15.to_s)
    expect(page).to_not have_content(@sample_park + 3.to_s)
    expect(page).to_not have_content(@sample_park + 7.to_s)

    click_on "‹ Prev"

    expect(page).to have_content(@sample_park + 3.to_s)
    expect(page).to have_content(@sample_park + 7.to_s)
    expect(page).to_not have_content(@sample_park + 15.to_s)
  end

  scenario "user clicks first link" do
    visit "/?page=4"

    expect(page).to have_content(@sample_park + 37.to_s)
    expect(page).to_not have_content(@sample_park + 22.to_s)
    expect(page).to_not have_content(@sample_park + 15.to_s)

    click_on "« First"

    expect(page).to have_content(@sample_park + 8.to_s)
    expect(page).to_not have_content(@sample_park + 22.to_s)
    expect(page).to_not have_content(@sample_park + 35.to_s)
  end

  scenario "user clicks last link" do
    visit "/"

    expect(page).to have_content(@sample_park + 8.to_s)
    expect(page).to_not have_content(@sample_park + 32.to_s)
    expect(page).to_not have_content(@sample_park + 25.to_s)

    click_on "Last »"

    expect(page).to have_content(@sample_park + 36.to_s)
    expect(page).to_not have_content(@sample_park + 6.to_s)
    expect(page).to_not have_content(@sample_park + 13.to_s)
  end
end
