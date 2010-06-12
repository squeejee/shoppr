module Shoppr
  class GeneralSearchResponse
    
    def initialize(options={})
      response = Shoppr::Client.get('/GeneralSearch', :query => options)
      h = Hashie::Mash.new(response["GeneralSearchResponse"])     
      
      Shoppr.map_mash_attrs(self, h)
      
      if self.categories.category.is_a?(Array)
        @categories = self.categories.category.map {|category| Category.new(category) } 
      else
        @categories = [Category.new(self.categories.category)]
      end
      
      if self.exceptions.exception.is_a?(Array)
        @exceptions = self.exceptions.exception.map {|exception| APIException.new(exception) } 
      else
        @exceptions = [APIException.new(self.exceptions.exception)]
      end
      
      @server_detail = ServerDetail.new(self.server_detail)  
      @client_tracking = ClientTracking.new(self.client_tracking)
      @related_terms = self.related_terms ? self.related_terms.term : []
      @search_history = SearchHistory.new(self.search_history)
    end
            
  end
end