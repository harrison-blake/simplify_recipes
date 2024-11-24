class ChangeWebsitesNameToRecipes < ActiveRecord::Migration[8.0]
  def change
    rename_table :websites, :recipes
  end
end
