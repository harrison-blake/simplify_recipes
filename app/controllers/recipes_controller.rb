require 'net/http'
require 'uri'
require 'json'

class RecipesController < ApplicationController
  def create
    recipe = Recipe.new(url: params[:recipe][:url])
    recipe.save

    uri = URI.parse("http://host.docker.internal:5000/api/simplify_recipe")
    response = Net::HTTP.post(
      uri, 
      { url: "https://cooking.nytimes.com/recipes/1025014-cheesy-green-chile-bean-bake" }.to_json, 
      "Content-Type" => "application/json"
    )

    parse_response(response)
    
    redirect_to recipe_path(recipe.id)
  end

  def show
    @recipe = Recipe.find(params['id'])
  end

  def parse_response(response)
    binding.pry
    JSON.parse(JSON.parse(response.body)['message'])
  end
end
