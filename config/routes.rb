Rails.application.routes.draw do
  get 'comments/new'
  get 'comments/create'
  get 'comments/edit'
  get 'comments/update'
  get 'comments/delete'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root 'users#index'
  get '/users', to: 'users#index'
  get '/users/:id', to: 'users#show'
  get '/users/:user_id/posts', to: 'posts#index'
  get 'users/:user_id/posts/:id', to: 'posts#show'
  get 'users/new', to: 'users#new'
  post 'users', to: 'users#create'
  get 'users/:id/edit', to: 'users#edit'
  patch 'users/:id', to: 'users#update'
  delete 'users/:id', to: 'users#destroy'
  get 'users/:user_id/posts/new', to: 'posts#new'
  post 'users/:user_id/posts', to: 'posts#create'
  get 'users/:user_id/posts/:id/edit', to: 'posts#edit'
  patch 'users/:user_id/posts/:id', to: 'posts#update'
  delete 'users/:user_id/posts/:id', to: 'posts#destroy'
end
