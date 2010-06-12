module Shoppr
  class Offer    
            
    def initialize(cat_mash)        
      Shoppr.map_mash_attrs(self, cat_mash)
      
      @store = Store.new(self.store)
      
      @featured = (@featured == "true" ? true : false)
      @used = (@used == "true" ? true : false)
      @smart_buy = (@smart_buy == "true" ? true : false)
    end
    
  end
end