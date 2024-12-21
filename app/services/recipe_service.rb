class RecipeService
  def self.get_recipe(url)
    API_URL = Rails.application.config.api_endpoint
    
    uri = URI.parse(API_URL)
    response = Net::HTTP.post(
      uri,
      { url: url }.to_json,
      "Content-Type" => "application/json"
    )

    JSON.parse(response.body)
  end
end
