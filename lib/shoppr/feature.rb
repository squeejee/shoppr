module Shoppr
  class Feature
    include ROXML
    xml_convention {|val| val.camelize(:lower) }
    xml_reader :name
    xml_reader :description
    xml_reader :values, :as => []
  end
end