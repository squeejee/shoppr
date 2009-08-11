module Shoppr
  class Category
    include ROXML
    xml_convention {|val| val.camelize(:lower) }
    xml_reader :id, :from => '@id'
    xml_reader :name
    xml_reader :category_url, :from => 'categoryURL'
    xml_reader :content_type
    xml_reader :items, :as => [Product], :in => 'items'
    xml_reader :attributes, :as => [Attribute], :in => 'attributes'
    xml_reader :categories, :as => [Category], :in => 'categories'
  end
end