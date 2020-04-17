class IngredientsController < ApplicationController
	def create
		recipe = Recipe.find(params[:ingredient][:recipe_id])
		ingredient = recipe.ingredients.create(ingredient_params)
		redirect_to recipe_path(recipe)
	end

	def ingredient_params
		params.require(:ingredient).permit(:food_id, :quantity, :cups, :weight_in_mg, :weight_in_ml)
	end
end
