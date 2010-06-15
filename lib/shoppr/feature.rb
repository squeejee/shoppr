module Shoppr
  class Feature
    
    attr_accessor :values
    def initialize(cat_mash)   
      Shoppr.map_mash_attrs(self, cat_mash)
      
      if self.value.is_a?(Array)
        @values = self.value.map {|value| value } 
      else
        @values = [self.value]
      end
      
    end
    
  end
end