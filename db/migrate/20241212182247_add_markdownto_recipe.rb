class AddMarkdowntoRecipe < ActiveRecord::Migration[8.0]
  def change
    add_column :recipes, :markdown, :text
  end
end
