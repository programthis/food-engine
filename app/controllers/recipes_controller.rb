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

	def update
		@recipe = Recipe.new(recipe_params)
		if @recipe.update(recipe_params)
			redirect_to recipe_path(@recipe)
		else
			render "edit"
		end
	end

	def show
		@recipe = Recipe.find(params[:id])
		@foods = Food.all
		@ingredient = Ingredient.new
	end

	def destroy
		recipe = Recipe.find(params[:id])
		recipe.destroy
		redirect_to root_path
	end

	def recipe_params
		params.require(:recipe).permit(:name, :content, :time_needed, :url, :image, :image_url).merge(user: current_user)
	end
end
