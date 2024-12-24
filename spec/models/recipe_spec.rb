require 'rails_helper'

RSpec.describe Recipe, type: :model do
  subject {
    Recipe.new(url: "https://someurl.com",
              author: "author",
              recipe_name: "name",
              ingredients: "wow",
              instructions: "yea")
    }

  it "is valid with valid attributes" do
    expect(subject).to be_valid
  end

  it "is not valid with a missing url" do
    subject.url = nil
    expect(subject).to_not be_valid
  end

  it "is not valid with a missing author" do
    subject.author = nil
    expect(subject).to_not be_valid
  end

  it "is not valid with a missing recipe name" do
    subject.recipe_name = nil
    expect(subject).to_not be_valid
  end

  it "is not valid with a missing ingredients" do
    subject.ingredients = nil
    expect(subject).to_not be_valid
  end

  it "is not valid with a missing instructions" do
    subject.instructions = nil
    expect(subject).to_not be_valid
  end
end
