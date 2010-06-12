module Shoppr
  class SearchHistory
    
    attr_accessor :category_selections
    
    def initialize(cat_mash)        
      Shoppr.map_mash_attrs(self, cat_mash)
      
      @category_selections = self.category_selection.map {|category_selections| CategorySelection.new(category_selections) } 
    end
    
  end
end