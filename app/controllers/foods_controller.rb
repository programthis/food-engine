class FoodsController < ApplicationController
	def index
		@foods = Food.all
	end

	def new
		@food = Food.new
	end

	def create
		@food = Food.new(food_params)
		if @food.save
			redirect_to root_path
		else 
			render json: { error: "Error creating food." }
		end
	end

	def show
		@food = Food.find(params[:id])
		@food_item = FoodItem.new
	end

	def food_params
		params.require(:food).permit(:name, :category, :expirable)
	end
end
