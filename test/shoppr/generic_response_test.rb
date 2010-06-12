require File.dirname(__FILE__) + '/../test_helper'

class GenericResponseTest < Test::Unit::TestCase
  include Shoppr
  
  context "When mapping generic response XML to ruby objects" do
    setup { @response = Shoppr::Client.new(true).generic_response }
    
    should "include server detail information" do
      @response.server_detail.api_version.should == '3.1 R21.4'
      @response.server_detail.api_env.should == 'sandbox'
    end
  end
end