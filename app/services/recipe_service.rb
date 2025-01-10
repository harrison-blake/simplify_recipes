class RecipeService def self.get_recipe(url)
api_endpoint = Rails.application.config.api_endpoint
uri = URI.parse(api_endpoint)

    begin
      response = Net::HTTP.post(
        uri,
        { url: url }.to_json,
        "Content-Type" => "application/json"
      )
    # if api is down log error and return error to controller
    rescue Errno::ENETUNREACH => e
      Rails.logger.error("Network unreachable: #{e.message}")
      response = { error: "Internal service is currently unavailable.", status: :service_unavailable }
    else
      JSON.parse(response.body)
    end
  end
end
