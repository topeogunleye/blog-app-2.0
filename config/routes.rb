Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  # Defines the root path route ("/")
  root to: redirect('users')
  resources :users, only: %i[index show] do
    resources :posts, only: %i[index show new create destroy]
    resources :comments, only: %i[new create destroy]
    resources :likes, only: %i[new create]
  end
end
