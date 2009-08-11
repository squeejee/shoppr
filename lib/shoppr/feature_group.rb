module Shoppr
  class FeatureGroup
    include ROXML
    xml_convention {|val| val.camelize(:lower) }
    xml_reader :name
    xml_reader :feature, :as => Feature
  end
end