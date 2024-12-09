require 'net/http'
require 'uri'
require 'json'

class RecipesController < ApplicationController
  def create
    recipe = Recipe.new(url: params[:recipe][:url])
    recipe.save

    uri = URI.parse("http://host.docker.internal:8000/api/simplify")
    response = Net::HTTP.post(
      uri, 
      { url: params['recipe']['url'] }.to_json, 
      "Content-Type" => "application/json"
    )

    parse_response(response, recipe)
    
    redirect_to recipe_path(recipe.id)
  end

  def show
    @recipe = Recipe.find(params['id'])
    @instructions = JSON.parse(@recipe['instructions'])
    @ingredients = JSON.parse(@recipe['ingredients'])
  end

  def parse_response(response, recipe)
    message = JSON.parse(response.body)['message']
    message = JSON.parse(message)

    recipe.author = message['author']
    recipe.recipe_name = message['recipe_name']
    recipe.ingredients = message['ingredients']
    recipe.instructions = message['instructions']

    recipe.save
  end
end
