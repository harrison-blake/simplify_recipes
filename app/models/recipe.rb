class Recipe < ApplicationRecord
    attribute :url, :string
    attribute :ingredients, :string
    attribute :instructions, :string
end
