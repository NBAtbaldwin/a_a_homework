require 'rails_helper'

feature "the signup process" do

  scenario "has a new user page" do
    visit new_user_url
    expect(page).to have_content "New User"
  end

  feature "signing up a user" do
    before(:each) do
      visit new_user_url
      fill_in 'user_email', :with => "testing@email.com"
      fill_in 'user_password', :with => "biscuits"
      click_on "create_account"
    end

    scenario "redirects to bands index page after signup" do
      expect(current_path).to eq("/bands")
    end
  end

  feature "with an invalid user" do
    before(:each) do
      visit new_user_url
      fill_in 'user_email', :with => "testing@email.com"
      click_on "create_account"
    end

    scenario "re-renders the signup page after failed signup" do
      expect(current_path).to eq("/users/new")
    end
  end

end
