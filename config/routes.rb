Rails.application.routes.draw do
  resources :menus
  resources :restaurants
  resources :customers
  resources :waitlists
  devise_scope :user do
     get "signup-user", to: "users/registrations#new_user"
     get "signup-restaurant", to: "users/registrations#new_rest"
     post "create-user", to: "users/registrations#create_user"
     post "create-restaurant", to: "users/registrations#create_rest"
     delete "destroy-user", to: "users/registrations#destroy"
     get "login", to: "users/sessions#new"
     get "sign_in", to: "users/sessions#new"
     post "sign_in", to: "users/sessions#create", as: "new_sign_in"
     get "logout", to: "users/sessions#destroy"
     get 'setting', to: "users/registrations#edit"
  end
  devise_for :users, controllers: {registrations: "users/registrations"}
  # get 'sessions/new'

  root 'dynamic_pages#home'

  #with .html
  get 'index.html' => 'dynamic_pages#index'
  get 'signup.html' => 'dynamic_pages#signup'
  get 'profile.html' => 'dynamic_pages#profile'
  get 'settings.html' => 'dynamic_pages#settings'
  get 'favorite.html' => 'dynamic_pages#favorite'
  get 'payment.html' => 'dynamic_pages#payment'
  get 'delivery.html' => 'dynamic_pages#delivery'

  #without .html
  get 'index' => 'dynamic_pages#index'
  get 'signup' => 'dynamic_pages#signup'
  get 'profile' => 'dynamic_pages#profile'
  get 'restaurants' => 'restaurants#index'
  get 'settings' => 'dynamic_pages#settings'
  get 'favorite' => 'dynamic_pages#favorite'
  get 'payment' => 'dynamic_pages#payment'
  get 'delivery' => 'dynamic_pages#delivery'
  get 'home' => 'dynamic_pages#home'
  get 'restaurant_page' => 'dynamic_pages#restaurant'

  #waitlist URL
  get 'waitlists_new' => 'waitlists#new'
  post 'waitlists_new' => 'waitlists#create'

  #restaurant URL
  get 'restaurant_new' => 'restaurants#new'
  get 'menus_new' => 'menus#new'
  get 'menus_edit' => 'menus#edit'
  #API 
  # post 'signupuser' => 'users/registrations#new_user'
  # post 'signuprest' => 'users/registrations#new_rest'

  # # get 'login' => 'sessions#new'
  # # post 'login' => 'sessions#create'
  # delete 'logout' => 'sessions#destroy'



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
