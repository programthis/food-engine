class FoodItemsController < ApplicationController
	def index
		@food_items = current_user.food_items
		@food_item = FoodItem.new
		@foods = Food.all
	end

	def create
		food = Food.find(params[:food_item][:food_id])
		food_item = food.food_items.create(food_item_params)
		redirect_to root_path
	end

	def food_item_params
		params.require(:food_item).permit(:quantity, :weight_in_mg).merge(user: current_user)
	end
end
