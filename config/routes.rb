Rails.application.routes.draw do


  get 'catalog', to: 'catalog#index', as: 'catalog'
  get 'catalog/:id', to: 'catalog#show', as: 'showProduct'
  get 'login', to: 'application#login', as: 'login'
  get 'logout', to: 'application#logout', as: 'logout'
  post 'check-login', to: 'application#checkLogin', as: 'checkLogin'
  root :to => "application#index"



  get 'cart', to: 'cart#index', as: 'cart'
  get 'cart/add-item/:id', to: 'cart#addItem', as: 'addItemToCart'
  get 'cart/sub-item/:id', to: 'cart#subtractItem', as: 'subItemToCart'
  get 'cart/remove-item/:id', to: 'cart#removeItem', as: 'removeItemFromCart'
  get 'cart/empty', to: 'cart#empty', as: 'emptyCart'
  get 'cart/checkout', to: 'cart#checkout', as: 'checkoutCart'

  namespace :administration do
    resources :products
    resources :customers
    resources :providers
  end

  resources :administration

  # resources :administration
  # get 'administration/index'

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
