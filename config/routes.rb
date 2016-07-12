Rails.application.routes.draw do
	root 'users#new'
	get '/' => 'users#new'

	get '/tags' => 'tags#index'
  get '/tags/new' => 'tags#new', as: :new_tag
  get '/tags/:id/edit' => 'tags#edit', as: :edit_tag 
  patch '/tags/:id' => 'tags#update'
	get '/tags/:id' => 'tags#show', as: :tag
  post '/tags' => 'tags#create'

  get '/tags/:id/new' => 'destinations#new', as: :new_destination
	post '/tags/:id/new' => 'destinations#create'
  get '/destinations' => 'destinations#index'
  get '/destinations/new' =>  'destinations#new', as: :create_destination
  get '/destinations/:id' => 'destinations#show', as: :destination	
	get '/destinations/:id/edit' => 'destinations#edit', as: :edit_destination
	patch '/destinations/:id' => 'destinations#update'

	get 'signup' => 'users#new'
  get '/users' => 'users#index', as: :users
  get '/profile/:id/edit' => 'users#edit', as: :edit_user
  patch '/profile/:id' => 'users#update'
  get '/profile/:id' => 'users#show', as: :profile

	get '/login' => 'sessions#new'
	post '/login' =>'sessions#create'	
	delete 'logout' => 'sessions#destroy'

  get '/countries' => 'countries#index', as: :country_index
  get '/countries/new' => 'countries#new', as: :create_country
  get '/countries/:id/edit' => 'countries#edit', as: :edit_country
  get '/countries/:id/new' => 'tags#new', as: :tag_in_country
  patch '/countries/:id' => 'countries#update'
  get '/countries/:id' => 'countries#show', as: :country

  get '/messages' => 'messages#index', as: :messages
  post '/messages' => 'messages#create'

  get '/tips/:id/edit' => 'tips#edit', as: :edit_tip
  get '/tips' => 'tips#index', as: :tips
  get '/tips/new' => 'tips#new', as: :tip_new
  post '/tips' => 'tips#create'
  patch '/tips/:id' => 'tips#update'

  resources :users, only: [:index, :edit, :update, :create, :destroy]
  resources :countries, only: [:index, :edit, :update, :create, :destroy]
  resources :tags, only: [:index, :show, :edit, :update, :create, :destroy]
  resources :destinations, only: [:show, :edit, :update, :create, :destroy]
  resources :tips, only: [:create]
  

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
