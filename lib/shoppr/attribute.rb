module Shoppr
  class Attribute
    include ROXML
    xml_convention {|val| val.camelize(:lower) }
    xml_reader :id, :from => '@id'
    xml_reader :name
    xml_reader :attribute_url, :from => 'attributeURL'
    xml_reader :attribute_values, :as => [AttributeValue], :from => 'attributeValues'
  end
end