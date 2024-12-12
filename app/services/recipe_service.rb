class RecipeService
  def self.get_recipe(url)
    uri = URI.parse("http://host.docker.internal:8000/api/simplify")
    response = Net::HTTP.post(
      uri, 
      { url: url }.to_json, 
      "Content-Type" => "application/json"
    )

    response
  end
end