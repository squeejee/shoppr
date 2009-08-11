module Shoppr
  class ProductSelection
    include ROXML
    xml_convention {|val| val.camelize(:lower) }
    xml_reader :id, :from => '@id'
    xml_reader :name
    xml_reader :product_url, :from => 'productURL'
    xml_reader :dropped?, :from => '@dropped'
  end
end