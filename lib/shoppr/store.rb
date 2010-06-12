module Shoppr
  class Store
    
    attr_accessor :rating, :review_count, :rating_image
    
    def initialize(cat_mash)        
      Shoppr.map_mash_attrs(self, cat_mash)
      
      @rating = self.rating_info.rating
      @review_count = self.rating_info.reviewCount
    end
    
  end
end