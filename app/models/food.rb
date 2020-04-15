class Food < ApplicationRecord
	include PgSearch::Model
	has_many :food_items
	has_many :ingredients
	has_one_attached :image
	pg_search_scope :search_by_name, against: [:name, :category],
		using: {
			tsearch: {
				prefix: true,
				negation: true,
				highlight: {
					start_sel: '<b>',
					stop_sel: '</b>',
				}
			}
    	}
end
