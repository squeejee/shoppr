module Shoppr
  class FeatureRating
    include ROXML
    xml_convention {|val| val.camelize(:lower) }
    xml_reader :name
    xml_reader :value, :as => Float
  end
end