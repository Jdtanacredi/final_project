FinalProject::Application.routes.draw do
  root 'store#index'#, as: 'store'
  devise_for :users, path_names: {sign_in: 'login', sign_out: 'logout'}

  get 'charges/create'
  namespace :admin do
    resources :products
    resources :skus
    resources :users, only: [:index]
    resources :orders
  end
  resources :products, only: [:index, :show]
  resources :store, only: [:index, :show]
  resources :charges, only: [:create]
end
