module Shoppr
  class Image
    include ROXML
    xml_convention {|val| val.camelize(:lower) }
    xml_reader :available?, :from => '@available'
    xml_reader :height, :as => Integer, :from => '@height'
    xml_reader :width, :as => Integer, :from => '@width'
    xml_reader :source_url, :from => 'sourceURL'
  end
end