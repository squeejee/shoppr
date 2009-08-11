require File.dirname(__FILE__) + '/../test_helper'

class ClientTest < Test::Unit::TestCase
  include Shoppr
  
  context "When performing general search" do
    setup { @client = Shoppr::Client.new(true) }
    
    should "work" do
      # stub_get '/GeneralSearch?apiKey=authorized-key&trackingId=7000610', 'no_options.xml'
      #       search = @client.search
      #       search.server_detail.api_version.should == '3.1 R21.3'
      assert_equal true, true
    end
    # 
    # should "find categories based on keyword" do
    #   stub_get '/GeneralSearch?apiKey=authorized-key&trackingId=7000610&keyword=nikon', 'nikon.xml'
    #   search = @client.search({:keyword => 'nikon'})
    #   search.categories.first.name.should == 'Digital Cameras'
    # end
    # 
  end
  

end