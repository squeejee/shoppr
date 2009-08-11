module Shoppr
  class Offer
    include ROXML
    xml_convention {|val| val.camelize(:lower) }
    xml_reader :id, :from => '@id'
    xml_reader :name
    xml_reader :description
    xml_reader :manufacturer
    xml_reader :images, :as => [Image], :in => 'imageList'
    xml_reader :stock_status
    xml_reader :store_notes
    xml_reader :base_price, :as => Float
    xml_reader :tax, :as => Float
    xml_reader :shipping_cost, :as => Float
    xml_reader :total_price, :as => Float
    xml_reader :offer_url, :from => 'offerURL'
    xml_reader :store, :as => Store
    xml_reader :cpc, :as => Float
    xml_reader :category_id, :as => Integer
    xml_reader :product_id, :as => Integer
    xml_reader :featured?, :from => :attr
    xml_reader :used?, :from => :attr
    xml_reader :smart_buy?, :from => :attr
  end
end