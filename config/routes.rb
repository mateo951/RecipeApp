Rails.application.routes.draw do
  get 'recipes/index'
  get 'recipes/show'
  devise_for :users
  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end
  root "recipes#index"
  resources :users
  resources :recipes
  resources :foods, only: %i[index new create show destroy]
end