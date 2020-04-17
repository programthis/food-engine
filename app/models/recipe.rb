class Recipe < ApplicationRecord
	has_many :ingredients
	belongs_to :user
	has_one_attached :image
	has_rich_text :content
end
