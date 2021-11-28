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

  it "should contain a link to create new authors" do
    visit authors_path
    expect(page).to have_link 'New Author', href: new_author_path
  end
end