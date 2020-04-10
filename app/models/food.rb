class Food < ApplicationRecord
	has_many :food_items
	has_many :ingredients
end
