module Shoppr
  class FeatureGroup
    include ROXML
    xml_convention {|val| val.camelize(:lower) }
    xml_reader :name
    xml_reader :description
    xml_reader :features, :as => [Feature]
  end
end