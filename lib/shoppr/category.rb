module Shoppr
  class Category
    include ROXML
    xml_convention {|val| val.camelize(:lower) }
    xml_reader :id, :from => '@id', :as => Integer
    xml_reader :name
    xml_reader :category_url, :from => 'categoryURL'
    xml_reader :content_type
    xml_reader :products, :as => [Product], :from => 'items/product'
    xml_reader :offers, :as => [Offer], :from => 'items/offer'
    xml_reader :attributes, :as => [Attribute], :in => 'attributes'
    xml_reader :categories, :as => [Category], :in => 'categories'
  end
end