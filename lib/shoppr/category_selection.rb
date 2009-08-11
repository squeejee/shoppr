module Shoppr
  class CategorySelection
    include ROXML
    xml_convention {|val| val.camelize(:lower) }
    xml_reader :id, :from => '@id'
    xml_reader :name
    xml_reader :category_url, :from => 'categoryURL'
    xml_reader :dropped?, :from => '@dropped'
  end
end