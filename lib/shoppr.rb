require 'forwardable'
require 'rubygems'
require 'active_support'

gem 'roxml'
require 'roxml'

gem 'mash', '0.0.3'
require 'mash'

gem 'httparty', '0.4.3'
require 'httparty'

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

require File.join(directory, 'shoppr', 'client')
require File.join(directory, 'shoppr', 'api_exception')
require File.join(directory, 'shoppr', 'client_tracking')
require File.join(directory, 'shoppr', 'server_detail')
require File.join(directory, 'shoppr', 'generic_search_response')