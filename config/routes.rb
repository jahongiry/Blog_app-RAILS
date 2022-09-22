Rails.application.routes.draw do
  resources :users
  resources :posts
  resources :likes
  resources :comments
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end