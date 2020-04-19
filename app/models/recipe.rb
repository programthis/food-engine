class Recipe < ApplicationRecord
	attribute :image_url, :string, default: "default.jpg"
	has_many :ingredients, dependent: :destroy
	belongs_to :user
	has_one_attached :image
	has_rich_text :content
end
