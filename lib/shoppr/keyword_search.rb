module Shoppr
  class KeywordSearch
    include ROXML
    xml_convention {|val| val.camelize(:lower) }
    xml_reader :dropped?, :from => '@dropped'
    xml_reader :modified?, :from => '@modified'
    xml_reader :original_keyword
    xml_reader :result_keyword
  end
end