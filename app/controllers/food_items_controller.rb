class FoodItemsController < ApplicationController
	def index
		@food_items = current_user.food_items
		@food_item = FoodItem.new
		@foods = Food.all

		food_ids = []
		@food_items.each do |food_item|
			food_ids << food_item.food_id
		end
		@recipes = Recipe.joins(:ingredients).where("ingredients.food_id IN ( ? )", food_ids)
	end

	def create
		food = Food.find(params[:food_item][:food_id])
		if FoodItem.where(food_id: food.id).blank?
			food_item = food.food_items.create(food_item_params)
		else
			food_item = FoodItem.find_by(food_id: food.id)
			food_item.quantity += (params[:food_item][:quantity]).to_i
			food_item.weight_in_mg += (params[:food_item][:weight_in_mg]).to_f
			food_item.save
		end
		redirect_to root_path
	end

	def food_item_params
		params.require(:food_item).permit(:quantity, :weight_in_mg).merge(user: current_user)
	end
end
