Rails.application.routes.draw do
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'
	root 'pages#home'

  get '/' => 'pages#home'
  get '/update_cities' => 'pages#update_cities'

	post '/create'=>"pages#create"

	get '/show' => 'pages#show'

  get '/show/:courseid'=>'pages#show'

  post '/show'=> 'pages#show'

  get '/signup'=>'user#signup'

  post '/createuser'=>'user#createuser'

  get '/login'=>'user#login'

  post '/login'=>'user#login'

  get '/logout'=>'user#logout'

	get '/checkcode'=>'user#checkcode'

	post '/checkcode' =>'user#checkcode'

	 get 'auth/:provider/callback'=> 'user#signup'

	 get "/delete/:comment_id"=>"pages#delete"

	 get "/addcourse"=>"pages#addcourse"

	 post "/addcourse"=>"pages#addcourse"

	 post "/createcourse"=>"pages#createcourse"

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
