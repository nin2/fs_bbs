FsBbs::Application.routes.draw do
  get "homes/index"

  devise_for :users

  #resources :users

  #resources :comments, only: [:index, :show, :new, :create]
  match 'comments/list/:board_id' => 'comments#list', via: :get, as: :comment_list
  match 'comments/new' => 'comments#new', via: :post, as: :new_comment
  match 'comments/create' => 'comments#create', via: :post
  match 'comments/post/:board_id' => 'comments#post', via: :post, as: :post_comment

  #resources :boards
  match '/boards/cut/:country_id' => 'boards#cut', via: :get, as: :cut_board
  match '/boards/list/:country_id' => 'boards#list', via: :get, as: :board_list
  match '/boards' => 'boards#create', via: :post
  match '/boards/:country_id' => 'boards#create', via: :post
  #match '/boards/:id' => 'boards#show', via: :get, as: :board

  resources :countries, only: [:index]

  resources :country_areas, only: [:index]


  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
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

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  # root :to => 'welcome#index'
  root :to => 'countries#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
