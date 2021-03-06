MprojDev1::Application.routes.draw do


  match "szukaj" => "home#search", :as => :search

  match "wiadomosci" => "front_infos#index", :as => :front_infos
  match "wiadomosc/:id" => "front_infos#show", :as => :front_info
  
  match "wydarzenia" => "front_events#index", :as => :front_events
  match "wydarzenie/:id" => "front_events#show", :as => :front_event
  
  match "o-projekcie" => "home#about", :as => :front_about

  match "video" => "front_videos#index", :as => :front_videos
  match "video/:id" => "front_videos#show", :as => :front_video

  match "galerie" => "front_galleries#index", :as => :front_galleries
  match "galeria/:id" => "front_galleries#show", :as => :front_gallery
  match "galeria-zwieksz-priorytet/:id" => "galleries#prior_up", :as => :pages_prior_up
  match "galeria-zmniejsz-priorytet/:id" => "galleries#prior_down", :as => :pages_prior_down

  match "kontakt" => "home#contact", :as => :contact

  match "english" => "home#english", :as => :english

  match "strony" => "front_pages#index", :as => :front_pages
  match "strona/:id" => "front_pages#show", :as => :front_page

  match "zapisz-do-neewslettera" => "home#subscribe", :as => :subscribe
  match "wyslij-wiadomosc" => "home#send_message", :as => :send_mesage

  resources :infos
  resources :events
  resources :galleries
  resources :vids
  resources :pages
  resources :newsletter_users

  match "admin" => "admin#index", :as => :admin
  match "admin/login" => "admin#login", :as => :admin_login
  match "admin/enter" => "admin#enter", :as => :admin_enter
  match "admin/logout" => "admin#logout", :as => :admin_logout

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
  root :to => 'home#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
