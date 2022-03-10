Rails.application.routes.draw do
  get 'recipes/index'
  get 'recipes/show'
  devise_for :users
  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end
  root "recipes#index"
  resources :users
  resources :foods, only: %i[index new create show destroy]
  resources :recipes, only: %i[index new create show destroy]
  resources :recipe_foods

end