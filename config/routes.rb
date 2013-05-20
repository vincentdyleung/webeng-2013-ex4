TripPlanner::Application.routes.draw do
  
  get "vote/:id/add" => "vote#add", :as => "add_vote"
  get "vote/:id/remove" => "vote#remove", :as => "remove_vote"
  get "vote/:trip_id" => "vote#show", :as => "vote"
  
  get "trips/all" => "trips#all"
  get "trips/:id/confirm" => "trips#confirm", :as => "confirm"
  
  get "pois/:id/mark" => "pois#mark", :as => "mark"
  get "pois/:id/unmark" => "pois#unmark", :as => "unmark"
  get "pois/:id/image" => "pois#image", :as => "image"
  post "pois/:id/image" => "pois#search_image"
  get "pois/:id/tweet" => "pois#tweet", :as => "tweet"
  post "pois/:id/tweet" => "pois#send_tweet", :as => "send_tweet"
  
  get "twitter" => "users#twitter_connect", :as => "twitter"
  get "auth" => "users#twitter_auth", :as => "auth"
  get "disconnect" => "users#twitter_disconnect", :as => "disconnect"
  
  get "logout" => "sessions#destroy", :as => "logout"
  get "login" => "sessions#new", :as => "login"
  get "signup" => "users#new", :as => "signup"
  
  get "users" => "users#index", :as => "users"
  get "user/:id" => "users#show", :as => "user"
  root :to => "sessions#new"
  
  get "vote/:id" => "vote#show", :as => "vote_path"
  
  resources :sessions

  resources :pois

  resources :trips

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

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
