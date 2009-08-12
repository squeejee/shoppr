require File.dirname(__FILE__) + '/../test_helper'

class ClientTest < Test::Unit::TestCase
  include Shoppr
  
  context "When performing general search" do
    setup { @client = Shoppr::Client.new(true) }
    
    should "get the api version" do
      stub_get '/', 'generic_response.xml'
      @client.api_version.should == '3.1 R21.4'
    end

  end
  

end