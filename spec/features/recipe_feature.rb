require "rails_helper"

VCR.configure do |config|
  config.cassette_library_dir = 'spec/cassettes'
  config.hook_into :webmock
end

RSpec.feature "Recipe Creation", type: :feature do
  scenario "summarizes a new recipe" do
    visit "/"
    url =  'https://www.allrecipes.com/recipe/223042/chicken-parmesan/'
    fill_in 'recipe[url]', with: url

    VCR.use_cassette('chicken_parm') do
      click_button "commit"
    end

    expect(page).to have_text("John Mitzewich")
    expect(page).to have_text("Chicken Parmesan")
    expect(Recipe.last['author']).to eq('John Mitzewich')
    expect(Recipe.last['recipe_name']).to eq('Chicken Parmesan')
  end
end
