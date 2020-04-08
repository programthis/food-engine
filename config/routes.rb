Rails.application.routes.draw do
    devise_for :users
    devise_for :foods

    authenticate :user do
        root to: "food_items#index"
    	resources :food_items
        # devise_scope :user do
        #     get 'users', to: 'devise/registrations#new'
        #     get 'users/password', to: 'devise/password#new'
        # end
    end
end
