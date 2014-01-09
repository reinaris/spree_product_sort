Spree::Product.class_eval do
  has_many :product_taxons
  has_many :taxons, :through=>:product_taxons

  scope :ordered, -> { includes(:product_taxons).order('spree_product_taxons.position') }

  scope :available, lambda { |*args| 
    where(["spree_products.available_on <= ?", args.first || Time.zone.now]).
      includes(:product_taxons).
      order('spree_product_taxons.taxon_id, spree_product_taxons.position') #group positions by taxon so that home page (0) works
  }

  after_create :create_product_taxon

  def create_product_taxon
    # new product added, create initial product_taxon assignment so that products on the main page can also be sorted.
    Spree::ProductTaxon.create(:product_id=>self.id, :taxon_id=>0)
  end

  def in_taxon?(taxon)
    case taxon
      when String
        self.taxons.map{|t| [t.name.downcase,t.permalink.downcase]}.flatten.include?(taxon.strip.downcase)
      when Integer
        self.taxons.map{|t| t.id}.include?(taxon)
      when Taxon
        self.taxons.include?(taxon)
      else
        false
    end
  end

end
