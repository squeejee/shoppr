module Shoppr
  class GeneralSearchResponse
    # include ROXML
    # xml_convention {|val| val.camelize(:lower) }
    # xml_reader :related_terms, :as => [], :in => 'relatedTerms', :from => 'term'
    # xml_reader :server_detail, :as => ServerDetail
    # xml_reader :exceptions, :as => [APIException], :in => 'exceptions'
    # xml_reader :client_tracking, :as => ClientTracking
    # xml_reader :search_history, :as => SearchHistory
    # xml_reader :categories, :as => [Category], :in => 'categories'
    
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