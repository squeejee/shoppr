module Shoppr
  class CategorySelection
    # include ROXML
    # xml_convention {|val| val.camelize(:lower) }
    # xml_reader :id, :from => '@id', :as => Integer
    # xml_reader :name
    # xml_reader :category_url, :from => 'categoryURL'
    # xml_reader :dropped?, :from => '@dropped'
    
    
    def initialize(cat_mash)        
      Shoppr.map_mash_attrs(self, cat_mash)
    end
  end
end