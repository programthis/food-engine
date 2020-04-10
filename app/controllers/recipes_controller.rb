class RecipesController < ApplicationController
	def new
		@recipe = Recipe.new
	end

	def create
		@recipe = Recipe.new(recipe_params)
		if @recipe.save
			redirect_to root_path
		else 
			render json: { error: "Error creating recipe." }
		end
	end

	def recipe_params
		params.require(:recipe).permit(:name, :description, :time_needed, :url).merge(user: current_user)
	end
end
