module Shoppr
  class Client
    include HTTParty
    format :xml
    
    attr_reader :api_key, :tracking_id, :sandboxed
    
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
    
    def search(options={})
      response = self.class.get('/GeneralSearch', :query => default_options.merge(options))
      format_response response
    end
    
    
    private
      def default_options
        {:apiKey => self.api_key, :trackingId => self.tracking_id}
      end

      def format_general_response(response)
        response.server_detail = rubyize_keys(response.delete('serverDetail'))
        
        response
      end
      
      def format_response(response)
        response = Mash.new(response)
        case response.keys.first
        when "GeneralSearchResponse"
          format_general_response(response["GeneralSearchResponse"])
        end
      end
      
      def rubyize_keys(hash)
        new_hash = {}
        hash.keys.each do |key|
          new_hash[key.underscore] = hash[key]
        end
        new_hash
      end
      
      
  end
end