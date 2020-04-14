class Food < ApplicationRecord
	has_many :food_items
	has_many :ingredients
	has_one_attached :image
end
