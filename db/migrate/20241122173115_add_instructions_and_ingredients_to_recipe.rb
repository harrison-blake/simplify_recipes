class AddInstructionsAndIngredientsToRecipe < ActiveRecord::Migration[8.0]
  def change
    add_column :recipes, :ingredients, :string
    add_column :recipes, :instructions, :text
  end
end
