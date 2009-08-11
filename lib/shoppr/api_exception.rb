module Shoppr
  class APIException
    include ROXML
    xml_reader :type, :from => :attr
    xml_reader :code, :as => Integer
    xml_reader :message
  end
end