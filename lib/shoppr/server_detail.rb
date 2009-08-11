module Shoppr
  class ServerDetail
    include ROXML
    xml_convention {|val| val.camelize(:lower) }
    xml_reader :api_env
    xml_reader :api_version
    xml_reader :build_number
    xml_reader :build_timestamp
    xml_reader :request_id
    xml_reader :timestamp, :as => Time
    xml_reader :response_time
  end
end