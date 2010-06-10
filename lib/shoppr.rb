require 'forwardable'
require 'rubygems'
require 'active_support'

gem 'roxml', '2.5.3'
require 'roxml'

gem 'mash', '0.0.3'
require 'mash'

gem 'httparty'
require 'httparty'

module HTTParty
  # module ClassMethods
  #   def parser(customer_parser)
  #     default_options[:parser] = customer_parser
  #   end
  # end
  
  class Request
    def parse_response(body)
      return nil if body.nil? or body.empty?
      if options[:parser].blank?
        case format
          when :xml
            Crack::XML.parse(body)
          when :json
            Crack::JSON.parse(body)
          when :yaml
            YAML::load(body)
          else
            body
          end
      else
        if options[:parser].is_a?(Proc)
          options[:parser].call(body)
        else
          body
        end
      end
    end
  end
end

module Shoppr
  
  def self.api_key
    @api_key ||= 'authorized-key'
  end
  
  def self.api_key=(value)
    @api_key = value
  end
  
  def self.tracking_id
    @tracking_id ||= '7000610'
  end
  
  def self.tracking_id=(value)
    @tracking_id = value
  end
  
end

directory = File.expand_path(File.dirname(__FILE__))


require File.join(directory, 'shoppr', 'api_exception')
require File.join(directory, 'shoppr', 'attribute_value')
require File.join(directory, 'shoppr', 'attribute')
require File.join(directory, 'shoppr', 'attribute_selection')
require File.join(directory, 'shoppr', 'image')
require File.join(directory, 'shoppr', 'feature_rating')
require File.join(directory, 'shoppr', 'consumer_review')
require File.join(directory, 'shoppr', 'store')
require File.join(directory, 'shoppr', 'offer')
require File.join(directory, 'shoppr', 'category_selection')
require File.join(directory, 'shoppr', 'client')
require File.join(directory, 'shoppr', 'client_tracking')
require File.join(directory, 'shoppr', 'keyword_search')
require File.join(directory, 'shoppr', 'dynamic_navigation_history')
require File.join(directory, 'shoppr', 'feature')
require File.join(directory, 'shoppr', 'feature_group')
require File.join(directory, 'shoppr', 'offer_selection')
require File.join(directory, 'shoppr', 'product_selection')
require File.join(directory, 'shoppr', 'search_history')
require File.join(directory, 'shoppr', 'server_detail')
require File.join(directory, 'shoppr', 'product')
require File.join(directory, 'shoppr', 'category')
require File.join(directory, 'shoppr', 'generic_response')
require File.join(directory, 'shoppr', 'general_search_response')
