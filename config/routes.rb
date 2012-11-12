Spree::Core::Engine.routes.prepend do
  
  namespace :admin do
		# callback for jQuery sort action
    match 'taxons/reorder_products/:id' => 'taxons#reorder_products', :via => :put
    match 'product_taxons/positions' => 'product_taxons#positions', :as => :product_sort
    resources :product_taxons do
      collection do
        get :positions
      end
    end
      
  end
end
