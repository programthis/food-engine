class FoodsController < ApplicationController
	def index
		if params[:term]
			@foods = Food.search_by_name(params[:term]).with_pg_search_highlight
		else
			@foods = Food.all
		end
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

	def update
		@food = Food.new(food_params)
		if @food.update(food_params)
			redirect_to food_path(@food)
		else
			render "edit"
		end
	end

	def show
		@food = Food.find(params[:id])
		@food_item = FoodItem.new
	end

	def destroy
		food = Food.find(params[:id])
		food.destroy
		redirect_to root_path
	end

	def food_params
		params.require(:food).permit(:name, :category, :expirable, :buy_from_url, :image, :image_url)
	end
end
