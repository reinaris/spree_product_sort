Spree::Admin::TaxonsController.class_eval do

  def reorder_products
    params[:product_taxons].each_with_index do |ptid, idx|
      pt = Spree::ProductTaxon.find(ptid.to_i)
      pt.insert_at(idx)
    end
    head :created
  end

  def reorder_taxons
    params[:taxon].each_with_index do |tid, idx|
      t = Spree::Taxon.find(tid.to_i)
      t.update_attribute(:nav_position, idx)
    end
    head :created
  end

end
