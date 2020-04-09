class FoodItemsController < ApplicationController
	def index
		@food_items = current_user.food_items
		@food_item = FoodItem.new
		@foods = Food.all
	end

	def create
		food = Food.find(params[:food_item][:id])
		food_item = food.food_items.create(user: current_user)
		redirect_to root_path
	end

	def food_item_params
		params.require(:food_item).permit(:name, :category, :expirable)
	end
end
