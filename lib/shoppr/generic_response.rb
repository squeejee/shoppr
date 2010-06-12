module Shoppr
  class GenericResponse
    
    def initialize()
      response = Shoppr::Client.get('/')
      h = Hashie::Mash.new(response["GenericResponse"])     
      
      Shoppr.map_mash_attrs(self, h)    
      
      @server_detail = ServerDetail.new(self.server_detail)  
    end
  end
end