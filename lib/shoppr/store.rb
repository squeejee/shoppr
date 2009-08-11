module Shoppr
  class Store
    include ROXML
    xml_convention {|val| val.camelize(:lower) }
    xml_reader :id, :from => '@id', :as => Integer
    xml_reader :name
    xml_reader :logo, :as => Image
    xml_reader :phone_number
    xml_reader :trusted?, :from => :attr
    xml_reader :authorized_reseller?, :from => :attr
    xml_reader :country_flag, :as => Image
    xml_reader :country_code, :from => 'countryFlag/countryCode'
    xml_reader :review_count, :as => Integer, :from => 'ratingInfo/reviewCount'
    xml_reader :rating, :as => Float, :from => 'ratingInfo/rating'
    xml_reader :rating_image, :as => Image, :from => 'ratingInfo/ratingImage'
    xml_reader :review_url, :from => 'ratingInfo/reviewURL'
  end
end