module Shoppr
  class GeneralSearchResponse
    include ROXML
    xml_convention {|val| val.camelize(:lower) }
    xml_reader :related_terms, :as => [], :in => 'relatedTerms', :from => 'term'
    xml_reader :server_detail, :as => ServerDetail
    xml_reader :exceptions, :as => [APIException], :in => 'exceptions'
    xml_reader :client_tracking, :as => ClientTracking
    xml_reader :search_history, :as => SearchHistory
    xml_reader :categories, :as => [Category], :in => 'categories'
  end
end