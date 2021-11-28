require 'rails_helper'

describe "Edit author page" do
  before do
    visit new_author_path
    fill_in 'author[first_name]', with: 'Alan'
    fill_in 'author[last_name]', with: 'Turing'
    fill_in 'author[homepage]', with: 'http://wikipedia.org/Alan_Turing'
    click_button("Save Author")
  end

  it "should not show an error when visited" do
    author = Author.find(1)
    expect(visit edit_author_path(author)).to_not have_text('error')
  end

  it "should change the authors first name correctly" do
    author = Author.find(1)
    visit edit_author_path(author)
    fill_in 'author[first_name]', with: 'Adam'
    click_button("Update Author")
    author.reload
    expect(author.first_name).to eq('Adam')
  end

  it "should change the authors last name correctly" do
    author = Author.find(1)
    visit edit_author_path(author)
    fill_in 'author[last_name]', with: 'Sandler'
    click_button("Update Author")
    author.reload
    expect(author.last_name).to eq('Sandler')
  end

  it "should change the authors homepage correctly" do
    author = Author.find(1)
    visit edit_author_path(author)
    fill_in 'author[homepage]', with: 'https://en.wikipedia.org/wiki/Adam_Sandler'
    click_button("Update Author")
    author.reload
    expect(author.homepage).to eq('https://en.wikipedia.org/wiki/Adam_Sandler')
  end
end