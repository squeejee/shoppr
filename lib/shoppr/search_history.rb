module Shoppr
  class SearchHistory
    # include ROXML
    # xml_convention {|val| val.camelize(:lower) }
    # xml_reader :category_selections, :as => [CategorySelection]
    # xml_reader :product_selections, :as => [ProductSelection]
    # xml_reader :offer_selections, :as => [OfferSelection]
    # xml_reader :dynamic_navigation_history, :as => DynamicNavigationHistory
    
    attr_accessor :category_selections
    
    def initialize(cat_mash)        
      Shoppr.map_mash_attrs(self, cat_mash)
      
      @category_selections = self.category_selection.map {|category_selections| CategorySelection.new(category_selections) } 
    end
    
  end
end