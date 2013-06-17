Cvsanaly::Application.routes.draw do
  resources :metrics_evos


  resources :months


  resources :commits_lines


  mount RailsAdmin::Engine => '/admin', :as => 'rails_admin'

  resources :tags


  resources :tag_revisions


  resources :commits


  resources :repositories


  resources :people


  resources :metrics


  resources :file_links


  resources :file_copies


  resources :branches


  resources :actions_file_names


  resources :actions


  resources :action_files


  resources :file_types


  resources :file_scms


  devise_for :users, :skip => 'invitation'

  match "files_history" => "welcome#files_history"
  match "loc_by_rev" => "welcome#loc_by_rev"
  match "modifications_amount_by_commit" => "welcome#modifications_amount_by_commit"
  match "modifications_amount_by_commit_filtered" => "welcome#modifications_amount_by_commit_filtered"
  match "bad_smell_by_sloc" => "welcome#bad_smell_by_sloc"
  match "bad_smell_by_sloc_filtered" => "welcome#bad_smell_by_sloc_filtered"
  match "bad_smell_by_nfunctions" => "welcome#bad_smell_by_nfunctions"
  match "bad_smell_by_nfunctions_filtered" => "welcome#bad_smell_by_nfunctions_filtered"
  match "metrics_evolution" => "welcome#metrics_evolution"
  match "metrics_evolution_filtered" => "welcome#metrics_evolution_filtered"
  match "commit_lines_graph" => "welcome#commit_lines_graph"
  match "loc_sum_by_date" => "welcome#loc_sum_by_date"
  match "loc_sum_by_date_filtered" => "welcome#loc_sum_by_date_filtered"
  match "change_dates" => "welcome#change_dates"
  match "change_dates_for_metrics_evo" => "welcome#change_dates_for_metrics_evo"

  root :to => "welcome#home"
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
