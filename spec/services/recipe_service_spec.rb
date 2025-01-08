require 'rails_helper'
require 'webmock/rspec'
require 'vcr'

VCR.configure do |config|
  config.cassette_library_dir = 'spec/cassettes'
  config.hook_into :webmock
end

RSpec.describe RecipeService do
  url = 'https://www.allrecipes.com/recipe/223042/chicken-parmesan/'
  data = []

  VCR.use_cassette('chicken_parm') do
    data = RecipeService.get_recipe(url)
  end

  describe '200 OK response (happy path)' do
    it 'should return data in the correct format' do
      expect(data).to be_a(Hash)
      expect(data).to have_key("converted")
      expect(data).to have_key("original")
    end
  end
end
