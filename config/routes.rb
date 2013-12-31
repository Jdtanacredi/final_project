FinalProject::Application.routes.draw do
  root 'store#index'#, as: 'store'
  #get "line_items/index"
  #get "carts/:id", to: 'carts#show'
  #get "products/index"
  #get "admin/products"
  devise_for :users, path_names: {sign_in: 'login', sign_out: 'logout'}
  #get "admin/products#index"
  get 'charges/create'
  namespace :admin do
    resources :products
    resources :skus
    resources :dashboards, only: [:show, :index]
    resources :users, only: [:index]
  end


  resources :products, only: [:index, :show]
  resources :line_items, only: [:index, :new, :create, :show, :edit, :update, :destroy]
  resources :carts, only: [:index, :new, :create, :show, :edit, :update, :destroy]
  resources :store, only: [:index, :show]
  resources :charges, only: [:create]
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
