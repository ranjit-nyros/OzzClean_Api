Ozzclean::Application.routes.draw do


  # For API Requests
  namespace :api, defaults: {format: 'json'} do
      resources :list_cleans
    end
    resources :api_keys
# End for API Requests

 # resources :test_summaries

# resources :sales_genie_data

  #resources :list_cleans
  get 'sales_genie_data/autocomplete_sales_genie_datum_state'
    get 'sales_genie_data/autocomplete_sales_genie_datum_zip'
resources :list_cleans do
    collection do
      match 'search' => 'list_cleans#search', :via => [:get, :post], :as => :search
    end
    resources :attachments, only: [:create, :destroy]
  end

resources :sales_genie_data do
    collection do
      match 'search' => 'sales_genie_data#search', :via => [:get, :post], :as => :search
    end
  end

resources :test_summaries do
    collection do
      match 'search' => 'test_summaries#search', :via => [:get, :post], :as => :search
    end
  end

match '/export_xls' => "sales_genie_data#export_xls"
match '/view_pdf' => "list_cleans#view_pdf"
match '/viewpdf' => "list_cleans#viewpdf"

   resources :pages

  get 'logout' => 'sessions#destroy', as: :logout
  get 'login' => 'sessions#new', as: :login
  get 'signup' => 'users#new', as: :signup
  get 'account' => 'users#edit'
match 'ozzmenu' => 'home#ozzmenu'

match '/convert' => 'list_cleans#convert'

match '/test' => 'sales_genie_data#test'
  resources :users, except: :destroy
  resources :sessions, only: [:new, :create, :destroy]

  resources :activities do
    collection do
      match 'search' => 'activities#search', :via => [:get, :post], :as => :search
    end
    resources :attachments, only: [:create, :destroy]
  end

  match "/ozzfun" => redirect {|params,req| "http://ozzfun.org"}
  match "/ozzdata" => redirect {|params,req| "http://ozzdata.com"}
  match "/ozzkey" => redirect {|params,req| "http://ozzkey.com"}
  match "/ozzkey2" => redirect {|params,req| "http://ozzkey2.com"}
  match "/ozzmap" => redirect {|params,req| "http://ozzmap.com"}
  match "/gitsuite" => redirect {|params,req| "http://gitsuite.com"}
  match "/ozzmoney" => redirect {|params,req| "http://ozzmoney.com"}
  match "/ozzcat" => redirect {|params,req| "http://ozzcat.com"}
  


  namespace :admin do
    resources :users do 
	collection do 
	get :edit, :as => 'account'
        put :update
	end
   end

    
    resources :personal_links, only: [:index] do
      collection do
        get :edit
        put :update
      end
    end

    resources :links do
    collection do
      match 'search' => 'links#search', :via => [:get, :post], :as => :search

    end
    end
    root to: "home#index"  
  end
  

  match '/privacy' => 'pages#privacy'
  match '/contact_us' => 'pages#new'
  match '/legal'=> 'pages#legal'
  match '/pricing' => 'pages#pricing'
  



  #links/url
  match "/image_view" => "admin/links#image_view"
  #match "/link_state" => "admin/links#index"
  match "/admin/links/sharebox/:id" => "admin/links#sharebox" 

  get '/:url'  => 'personal_links#show', :constraints => {:url => /[a-zA-Z_#]+/}
  root to: "home#index"
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

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
