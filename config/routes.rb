FinalProject::Application.routes.draw do
  get "shipping/index"
  get "orders/index"
  root 'store#index'#, as: 'store'
  get "search", to: "search#index"
  devise_for :users, path_names: {sign_in: 'login', sign_out: 'logout'}

  get 'charges/create'
  namespace :admin do
    resources :products
    resources :skus
    resources :users
    resources :orders
    resources :shipping, only: [:index, :show]
    resources :stamps, only: [:create]
  end
  resources :products, only: [:index, :show]
  resources :store, only: [:index, :show]
  resources :charges, only: [:create]
  resources :orders, only: [:index, :show]
end
