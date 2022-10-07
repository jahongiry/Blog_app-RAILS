Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  root "users#index"

  devise_scope :user do get '/users/sign_out' => 'devise/sessions#destroy' end

    resources :users, only: [:index, :show]  do
      resources :posts, only: [:index, :show, :new, :create, :destroy] do
        resources :comments, only: [:new, :create, :destroy]
        resources :likes, only: [:create]
      end
    end

end