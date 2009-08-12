module Shoppr
  class GenericResponse
    include ROXML
    xml_convention {|val| val.camelize(:lower) }
    xml_reader :server_detail, :as => ServerDetail
    xml_reader :exceptions, :as => [APIException], :in => 'exceptions'
  end
end