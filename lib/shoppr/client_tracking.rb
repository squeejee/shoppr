module Shoppr
  class ClientTracking
    # include ROXML
    # xml_convention {|val| val.camelize(:lower) }
    # xml_reader :height, :as => Integer, :from => '@height'
    # xml_reader :width, :as => Integer, :from => '@width'
    # xml_reader :type, :from => '@type'
    # xml_reader :source_url, :from => 'sourceURL'
    # xml_reader :href_url, :from => 'hrefURL'
    # xml_reader :title_text
    # xml_reader :alt_text
    
    def initialize(cat_mash)    
      Shoppr.map_mash_attrs(self, cat_mash)
    end
  end
end