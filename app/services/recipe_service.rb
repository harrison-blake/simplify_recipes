class RecipeService
  def self.get_recipe(url)
    api_endpoint = Rails.application.config.api_endpoint

    uri = URI.parse(api_endpoint)
    response = Net::HTTP.post(
      uri,
      { url: url }.to_json,
      "Content-Type" => "application/json"
    )

    JSON.parse(response.body)
  end
end
