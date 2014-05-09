Spree::Core::Engine.add_routes do

  namespace :admin do
		# callback for jQuery sort action
    get 'taxons/reorder_products/:id' => 'taxons#reorder_products', :as => :reorder_products, :via => :put
    get 'product_taxons/positions' => 'product_taxons#positions', :as => :product_sort
    resources :product_taxons do
      collection do
        get :positions
      end
    end

  end
end
