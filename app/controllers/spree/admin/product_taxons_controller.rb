module Spree
	module Admin
		class ProductTaxonsController < ResourceController
		  def positions
        # List of taxons, beginnning with a virtual taxons for Home, and then all taxons with pts
        @taxons = []
        #@taxons << Spree::Taxon.new({:name => t('main_index')})
        #@taxons |= Spree::Taxon.joins(:product_taxons).order(:name)

        @taxons |= Spree::Taxon.joins(:product_taxons).order(:name)
        @taxons << Spree::Taxon.new({:name => t('main_index')})
      end
		end
	end
end
