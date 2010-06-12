require File.dirname(__FILE__) + '/../test_helper'

class GeneralSearchResponseTest < Test::Unit::TestCase
  include Shoppr
  
  context "When mapping general search response XML to ruby objects" do
    setup do
      @client = Shoppr::Client.new(true)
      stub_get 'http://sandbox.api.shopping.com/publisher/3.0/rest/GeneralSearch?apiKey=authorized-key&showProductReviews=true&trackingId=7000610&groupItemsByCategory=true&showProductSpecs=true&showProductOffers=true&keyword=nikon', 'general_search_specs_offers_reviews.xml'
      # @general_response = GeneralSearchResponse.from_xml(fixture_file('general_search_specs_offers_reviews.xml')) 
      @general_response = @client.search({:keyword => "nikon", :show_product_specs => true, :show_product_reviews => true, :show_product_offers => true})
    end 
    
    should "include server detail information" do
      @general_response.server_detail.api_version.should == '3.1 R25.4.1'
      @general_response.server_detail.api_env.should == 'sandbox'
    end
    
    should "include exceptions" do
      @general_response.exceptions.size.should == 1
      @general_response.exceptions.first.code.should == '1112'
    end
    
    should "include client tracking info" do
      @general_response.client_tracking.height.should == '19'
      @general_response.client_tracking.width.should == '106'
      @general_response.client_tracking.type.should == 'logo'
      @general_response.client_tracking.alt_text.should == 'Digital Cameras'
    end
    
    should "include search history info" do
      @general_response.search_history.category_selections.size.should == 3
      @general_response.search_history.category_selections.last.id.should == '7185'
      @general_response.search_history.category_selections.last.category_url.should == 'http://www.shopping.com/xPP-digital_cameras-nikon~linkin_id-7000610?oq=nikon'
    end
    
    should "include related terms" do
      @general_response.related_terms.size.should == 20
      @general_response.related_terms.last.should == 'canon powershot sd800'
    end
    
    should "include categories" do
      @general_response.categories.size.should == 1
    end
    
    context "when mapping categories" do
      setup do
        @categories = @general_response.categories
      end
      
      should "include category properties" do
        @categories.first.id.should == '7185'
        @categories.first.name.should == 'Digital Cameras'
        @categories.first.category_url.should == 'http://www.shopping.com/xPP-digital_cameras-nikon~linkin_id-7000610?oq=nikon'
      end
      
      should "include products" do
        @categories.first.products.size.should == 2
      end
      
      context "when mapping products" do
        setup do
          @product = @categories.first.products.last
        end

        should "should map product attributes" do
          @product.id.should == '95738382'
          @product.name.should == "Nikon COOLPIX S4000 Digital Camera"
          @product.short_description.should == '12 Megapixel, Compact Camera, 3 in. LCD Screen, 4x Optical Zoom, With High Definition Video, Weight: 0.29 lb.'
          @product.min_price.should == '167.00'
          @product.max_price.should == '301.00'
        end
        
        context "when mapping offers" do
          setup do
            @offer = @product.offers.last
          end

          should "should include offer info" do
            @product.offers.size.should == 5
            @offer.featured.should == false
            @offer.smart_buy.should == false
            @offer.used.should == false
            @offer.name.should == 'Coolpix S4000 Digital Camera, 12MP, 4x Zoom, Black'
          end
          
          context "when mapping store info" do
            setup do
              @store = @offer.store
            end

            should "should include store info" do
              @store.name.should == 'PC Connection Express'
              @store.logo.height.should == '31'
              @store.rating.should == '4.50'
              @store.review_count.should == '5686'
            end
          end
          
        end
        
        should "include specifications" do
          @product.specifications.size.should == 14
        end
        
        context "when mapping feature groups" do
          setup do
            @feature_group = @product.specifications[1]
          end

          should "should include feature info" do
            @feature_group.features.size.should == 6
            @feature = @feature_group.features[3]
            @feature.name.should == 'Optical Zoom'
          end
        end
        
        
        should "include review info" do
          @product.review_count.should == '4'
          @product.rating.should == '4.00'
          @product.rating_image.source_url.should == 'http://img.shopping.com/sc/pr/sdc_stars_sm_4.gif'
          @product.reviews.size.should == 1
          @product.overall_rating.should == '4.00'
        end
        
        context "when mapping consumer reviews" do
          setup do
            @review = @product.reviews.first
          end

          should "include review info" do
            @review.author_id.should == 'hdsquared'
            @review.post_date.to_datetime.yday.should == 146
            @review.rating.should == '1.00'
          end
        end
        
        context "when mapping images" do

          should "should include images" do
            #@product.images.size.should == 4
            @product.images.first.height.should == '100'
            @product.images.last.width.should == '350'
            @product.images.last.source_url.should == "http://di1.shopping.com/images/pi/36/ff/8e/95738382-350x349-0-0.jpg?p=p2.90ca531eeb3e309b5933&a=2&c=1&l=7000610&t=100610122258&r=2"
          end
        end
        
      end
            
      should "include attributes" do
        @categories.first.attributes.size.should == 5
      end
      
      context "when mapping attributes" do
        setup do
          @attributes = @categories.first.attributes
        end

        should "include attribute properties" do
          attribute = @attributes.first
          attribute.id.should == 'Dynamic_Price_Range'
          attribute.name.should == 'Price Range'
          attribute.attribute_url.should == 'http://www.shopping.com/xPP-digital_cameras-nikon~linkin_id-7000610?oq=nikon'
        end
        
        should "include attribute values" do
          attribute_values = @attributes.first.attribute_values
          attribute_values.first.name.should == 'Below $150'
          attribute_values.first.attribute_value_url.should == 'http://www.shopping.com/xPP-digital_cameras-nikon-price_range_0_150~linkin_id-7000610'
        end
      end
    end
  end
end