module Shoppr
  class GenericResponse
    # include ROXML
    # xml_convention {|val| val.camelize(:lower) }
    # xml_reader :server_detail, :as => ServerDetail
    # xml_reader :exceptions, :as => [APIException], :in => 'exceptions'
    # 
    def initialize()
      response = Shoppr::Client.get('/')
      h = Hashie::Mash.new(response["GenericResponse"])     
      
      Shoppr.map_mash_attrs(self, h)    
      
      @server_detail = ServerDetail.new(self.server_detail)  
    end
  end
end