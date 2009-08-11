module Shoppr
  class OfferSelection
    include ROXML
    xml_convention {|val| val.camelize(:lower) }
    xml_reader :id, :from => '@id'
    xml_reader :name
    xml_reader :offer_url, :from => 'offerURL'
    xml_reader :dropped?, :from => '@dropped'
  end
end