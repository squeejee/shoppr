module Shoppr
  class APIException    
      # include ROXML
      # xml_reader :type, :from => :attr
      # xml_reader :code, :as => Integer
      # xml_reader :message
      
    def initialize(cat_mash)        
      Shoppr.map_mash_attrs(self, cat_mash)
    end
    
  end
end