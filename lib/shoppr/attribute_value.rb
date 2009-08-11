module Shoppr
  class AttributeValue
    include ROXML
    xml_convention {|val| val.camelize(:lower) }
    xml_reader :id, :from => '@id'
    xml_reader :name
    xml_reader :attribute_value_url, :from => 'attributeValueURL'
    xml_reader :matching_items_count, :as => Integer
  end
end