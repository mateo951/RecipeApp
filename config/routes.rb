Rails.application.routes.draw do
  resources :recipe_foods

  devise_for :users
  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end
  root "recipes#index"
  resources :users
  resources :recipes, only: [:index, :show, :new, :create, :destroy] do
    resources :recipe_foods, only: [:create, :destroy]
  end

  resources :foods, only: [:index, :new, :create, :destroy]  do
     resources :recipe_foods, only: [:create, :destroy]
  end
end