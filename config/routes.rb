Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :authors, only: %i[index show update create]
  resources :posts, only: %i[index show update create]
  get 'authors/:id/theirposts', to: 'authors#theirposts'
  resources :authors do
    resources :posts
  end
end
