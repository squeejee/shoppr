module Shoppr
  class Price
    include ROXML
    xml_convention {|val| val.camelize(:lower) }
    xml_reader :value, :from => :content, :as => Integer
    xml_reader :currency, :from => :attr
    xml_reader :check_site?, :from => :attr
  end
end