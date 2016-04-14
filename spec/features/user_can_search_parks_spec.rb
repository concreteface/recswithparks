require 'rails_helper'

feature 'user is able to search parks' do
  before(:all) do
    clear_users
    clear_parks
    @park1 = FactoryGirl.create(:park, name: 'Unique park')
    @park2 = FactoryGirl.create(:park, name: 'Green park', description: 'Blue 111111111111111111')
    @park3 = FactoryGirl.create(:park, name: 'Nowhere', description: 'not here 111111111111111111')
  end

  scenario 'user searches with a park name' do
    visit root_path
    within('div.top-bar-left') do
      fill_in('query', with: 'unique')

      click_button 'Search'
    end
    expect(page).to have_content(@park1.name)
    expect(page).to_not have_content(@park3.name)
  end

  scenario 'user searches with a description name' do
    visit root_path
    within('div.top-bar-left') do
      fill_in('query', with: 'blue')
      click_button 'Search'
    end
    expect(page).to have_content(@park2.name)
    expect(page).to_not have_content(@park3.name)
  end

  scenario 'user searches and returns no results' do
    visit root_path

    within('div.top-bar-left') do
      fill_in('query', with: 'incorrect')
      click_button 'Search'
    end

    expect(page).to have_content("Sorry, no results found for 'incorrect'")
    expect(page).to_not have_content(@park1.name)
  end
end
