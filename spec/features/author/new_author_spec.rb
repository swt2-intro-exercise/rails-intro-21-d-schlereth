require 'rails_helper'

describe "New author page", type: :feature do
  it "should exist at 'new_author_path' and render withour error" do
    # https://guides.rubyonrails.org/routing.html#path-and-url-helpers
    visit new_author_path
  end

  it "should have text inputs for first name, last name and homepage of an author" do
    visit new_author_path
    expect(page).to have_field('author[first_name]')
    expect(page).to have_field('author[last_name]')
    expect(page).to have_field('author[homepage]')
  end

  describe "adding an author without last name" do
    before do
      visit new_author_path
      fill_in 'author[first_name]', with: 'Alan'
      fill_in 'author[homepage]', with: 'http://wikipedia.org/Alan_Turing'
      click_button("Save Author")
    end
    it "should display an error message" do
      expect(page).to have_text('error')
    end
  end
end
