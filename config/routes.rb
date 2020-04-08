Rails.application.routes.draw do
    devise_for :users

    authenticate :user do
        

        # devise_scope :user do
        #     get 'users', to: 'devise/registrations#new'
        #     get 'users/password', to: 'devise/password#new'
        # end
    end
end
