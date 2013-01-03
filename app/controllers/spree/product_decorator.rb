# Overwrite the function that loads products in the taxons
module Spree
  Product.class_eval do
    add_search_scope :in_taxon do |taxon|
      select("DISTINCT(spree_products.id), spree_products.*, spree_product_taxons.taxon_id, spree_product_taxons.position").
          joins(:taxons).
          where(Taxon.table_name => { :id => taxon.id })
    end
  end
end
