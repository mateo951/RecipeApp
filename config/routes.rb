Rails.application.routes.draw do
  devise_for :users
  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end
  root "users#index"
  resources :users
  resources :foods, only: %i[index new create show destroy]

end