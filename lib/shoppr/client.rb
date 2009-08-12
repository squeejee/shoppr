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
    
    def api_version
      @api_version ||= self.class.get('/').server_detail.api_version
    end
    
    def search(options={})
      response = self.class.get('/GeneralSearch', :query => default_options.merge(options))
      GeneralSearchResponse.from_xml(response)
    end
    
    
    private
      def default_options
        {:apiKey => self.api_key, :trackingId => self.tracking_id}
      end
  end
end