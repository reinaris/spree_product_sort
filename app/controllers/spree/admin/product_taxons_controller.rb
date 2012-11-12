module Spree
	module Admin
		class ProductTaxonsController < ResourceController
		  def positions
        # List of taxons, beginnning with a virtual taxons for Home, and then all taxons with pts
        @taxons = []
        @taxons |= Spree::Taxon.order(:name)
      end
		end
	end
end
