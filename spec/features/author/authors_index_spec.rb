require 'rails_helper'

describe "Authors index page", type: :feature do

  it "should exist and render correctly" do
    visit authors_path
  end

  it "should contain a table with headings 'name' and 'homepage'" do
    visit authors_path
    expect(page).to have_css('table', text: 'Name')
    expect(page).to have_css('table', text: 'Homepage')
  end

  describe "When creating a new Author" do
    before do
      visit new_author_path
      fill_in 'author[first_name]', with: 'Alan'
      fill_in 'author[last_name]', with: 'Turing'
      fill_in 'author[homepage]', with: 'http://wikipedia.org/Alan_Turing'
      click_button("Save Author")
      visit authors_path
    end

    it "the author should show up on the index page" do
      expect(page).to have_text('Alan Turing')
    end

    it "the homepage should show up on the index page" do
      expect(page).to have_text('http://wikipedia.org/Alan_Turing')
    end

    it "should link to the authors details page" do
      expect(page).to have_link('Details', href: author_path(1))
    end

  end

  it "should contain a link to create new authors" do
    visit authors_path
    expect(page).to have_link 'New Author', href: new_author_path
  end
end