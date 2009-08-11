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
    xml_reader :country_code, :from => '/countryFlag/countryCode'
  end
end