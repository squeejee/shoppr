module Shoppr
  class Category
    
    def initialize(cat_mash)        
      Shoppr.map_mash_attrs(self, cat_mash)
      
      @attributes = self.attributes.attribute.map {|attribute| Attribute.new(attribute) } 
    end
    
    def products
      self.items.product.map {|product| Product.new(product) } 
    end
    
  end
end