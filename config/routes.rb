Rails.application.routes.draw do
  resources :movies
  devise_for :users
  get 'users/:id' => 'users#show', as: :user
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root to: 'movies#index'
end
