module Shoppr
  class Client
    include HTTParty
    format :xml
    
    attr_reader :api_key, :tracking_id, :sandboxed, :api_version
    
    # Get your api_key found here http://developer.shopping.com/docs/Getting_Started
    def initialize(sandboxed=false)
      @api_key ||= Shoppr.api_key
      @tracking_id ||= Shoppr.tracking_id
      
      @sandboxed = sandboxed
      
      base_uri = (self.sandboxed? ? 'sandbox.api.shopping.com/publisher/3.0/rest' : 'publisher.usb.api.shopping.com/publisher/3.0/rest')
      self.class.base_uri base_uri
    end
    
    def sandboxed?
      !!@sandboxed
    end
    
    def generic_response
      @generic_response ||= GenericResponse.new()
    end
    
    def api_version
      # self.class.parser Proc.new {|response| GenericResponse.from_xml(response)}
      # @api_version ||= self.class.get('/').server_detail.api_version
      @api_version ||= generic_response.server_detail.api_version
      
    end
    
    def search(options={})
      # self.class.parser Proc.new {|response| GeneralSearchResponse.parse_search_results(response)}
      response = GeneralSearchResponse.new(default_options.merge(prep_query_options(options))) 
    end
    
    
    private
      def default_options
        {:apiKey => self.api_key, :trackingId => self.tracking_id, :groupItemsByCategory => true}
      end
      
      def prep_query_options(options)
        opts = {}
        options.each do |key, value|
          opts[key.to_s.camelize(:lower)] = value
        end
        opts
      end
  end
end