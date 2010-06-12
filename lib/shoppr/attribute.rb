module Shoppr
  class Attribute   
      
    def initialize(cat_mash)    
      Shoppr.map_mash_attrs(self, cat_mash)
      
      if self.attribute_values.attributeValue.is_a?(Array)      
        @attribute_values = self.attribute_values.attributeValue.map {|f| AttributeValue.new(f)}
      elsif self.attribute_values.attributeValue
        @attribute_values = [AttributeValue.new(self.attribute_values.attributeValue)]
      else
        @attribute_values = []
      end
    end
  end
end