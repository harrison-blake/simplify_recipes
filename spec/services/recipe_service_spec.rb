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

  describe '200 OK response' do
    before do
      VCR.use_cassette('http_success') do
        data = RecipeService.get_recipe(url)
      end
    end
      
    it 'should return data in the correct format' do
      expect(data).to be_a(Hash)
      expect(data).to have_key("converted")
      expect(data).to have_key("original")
    end
  end

  # Net::HTTP does not trigger vcr to record a cassett if service is completely down
  # stub a call instead
  describe '503 Service Unavailable response' do
    before do
      allow(Net::HTTP).to receive(:post).and_raise(Errno::ENETUNREACH.new("Network is unreachable"))
      data = RecipeService.get_recipe(url)  
    end

    it 'should return data in the correct format' do
      expect(data).to be_a(Hash)
      expect(data).to have_key(:error)
      expect(data[:error]).to eq("Internal service is currently unavailable.")
      expect(data[:status]).to eq(:service_unavailable)
    end
  end
end
