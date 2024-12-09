class AddRecipeNameToRecipe < ActiveRecord::Migration[8.0]
  def change
    add_column :recipes, :recipe_name, :string
    add_column :recipes, :author, :string
  end
end
