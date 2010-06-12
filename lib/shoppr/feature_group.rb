module Shoppr
  class FeatureGroup
    
    attr_accessor :features
    def initialize(cat_mash)   
      Shoppr.map_mash_attrs(self, cat_mash)

      if self.feature.is_a?(Array)      
        @features = self.feature.map {|f| Feature.new(f)}
      else
        @features = [Feature.new(self.feature)]
      end
    end
  end
end