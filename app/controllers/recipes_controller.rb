require 'net/http'
require 'uri'
require 'json'

class RecipesController < ApplicationController
  def create
    recipe = Recipe.new(url: params[:recipe][:url])
    recipe.save

    response = RecipeService.get_recipe(params['recipe']['url'])
    parse_response(response, recipe)
    
    redirect_to recipe_path(recipe.id)
  end

  def show
    @recipe = Recipe.find(params['id'])
    @instructions = JSON.parse(@recipe['instructions'])
    @ingredients = JSON.parse(@recipe['ingredients'])
  end

  private
  def parse_response(response, recipe)
    simplified_markdown = JSON.parse(response['converted'])

    recipe.markdown = response['original']
    recipe.author = simplified_markdown['author']
    recipe.recipe_name = simplified_markdown['recipe_name']
    recipe.ingredients = simplified_markdown['ingredients']
    recipe.instructions = simplified_markdown['instructions']

    recipe.save
  end
end
