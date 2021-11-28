require 'rails_helper'

RSpec.describe Author, type: :model do
  author = Author.new(first_name: "Alan", last_name: "Turing", homepage: "http://wikipedia.org/Alan_Turing")

  it "should have the correct first name" do
    expect(author.first_name).to eq("Alan")
  end

  it "should have the correct last name" do
    expect(author.last_name).to eq("Turing")
  end

  it "should have the correct full name" do
    expect(author.name).to eq("Alan Turing")
  end

  it "should have the correct homepage" do
    expect(author.homepage).to eq("http://wikipedia.org/Alan_Turing")
  end

  it "should not be valid without last name" do
    invalid_author = Author.new(first_name: "Alan", homepage: "http://wikipedia.org/Alan_Turing")
    expect(invalid_author).to_not be_valid
  end
end
