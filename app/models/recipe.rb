class Recipe < ApplicationRecord
  validates :url, presence: true
  validates :author, presence: true
  validates :recipe_name, presence: true
  validates :ingredients, presence: true
  validates :instructions, presence: true
end
