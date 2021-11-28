require 'rails_helper'

describe "Delete author" do
  before do
    visit new_author_path
    fill_in 'author[first_name]', with: 'Alan'
    fill_in 'author[last_name]', with: 'Turing'
    fill_in 'author[homepage]', with: 'http://wikipedia.org/Alan_Turing'
    click_button("Save Author")
    visit new_author_path
    fill_in 'author[first_name]', with: 'Adam'
    fill_in 'author[last_name]', with: 'Sandler'
    fill_in 'author[homepage]', with: 'https://en.wikipedia.org/wiki/Adam_Sandler'
    click_button("Save Author")
  end
end