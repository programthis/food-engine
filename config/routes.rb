Rails.application.routes.draw do
    devise_for :users
    authenticate :user do
        root to: "food_items#index"
        resources :foods
    	resources :food_items
        resources :recipes
    end
end
