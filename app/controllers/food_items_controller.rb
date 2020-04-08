class FoodItemsController < ApplicationController
	def index
		@food_items = current_user.food_items
	end
end
