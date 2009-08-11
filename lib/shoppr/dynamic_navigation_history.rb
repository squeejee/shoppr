module Shoppr
  class DynamicNavigationHistory
    include ROXML
    xml_convention {|val| val.camelize(:lower) }
    xml_reader :keyword_search, :as => KeywordSearch
    xml_reader :attribute_selection, :as => AttributeSelection
  end
end