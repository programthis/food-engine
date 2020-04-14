class RecipesController < ApplicationController
	def index
		@recipes = Recipe.all
	end

	def new
		@recipe = Recipe.new
	end

	def create
		@recipe = Recipe.new(recipe_params)
		if @recipe.save
			redirect_to recipe_path(@recipe)
		else 
			render json: { error: "Error creating recipe." }
		end
	end

	def show
		@recipe = Recipe.find(params[:id])
		@foods = Food.all
		@ingredient = Ingredient.new
	end

	def recipe_params
		params.require(:recipe).permit(:name, :description, :time_needed, :url, :image).merge(user: current_user)
	end
end
