require File.dirname(__FILE__) + '/../test_helper'

class GeneralSearchResponseTest < Test::Unit::TestCase
  include Shoppr
  
  context "When mapping general search response XML to ruby objects" do
    setup { @general_response = GeneralSearchResponse.from_xml(fixture_file('general_search_specs_offers_reviews.xml')) }
    
    should "include server detail information" do
      @general_response.server_detail.api_version.should == '3.1 R21.4'
      @general_response.server_detail.api_env.should == 'sandbox'
    end
    
    should "include exceptions" do
      @general_response.exceptions.size.should == 1
      @general_response.exceptions.first.code.should == 1112
    end
    
    should "include client tracking info" do
      @general_response.client_tracking.height.should == 19
      @general_response.client_tracking.width.should == 106
      @general_response.client_tracking.type.should == 'logo'
      @general_response.client_tracking.alt_text.should == 'Digital Cameras'
    end
    
    should "include search history info" do
      @general_response.search_history.category_selections.size.should == 3
      @general_response.search_history.category_selections.last.id.should == 7185
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
        @categories.first.id.should == 7185
        @categories.first.name.should == 'Digital Cameras'
        @categories.first.category_url.should == 'http://www.shopping.com/xPP-digital_cameras-nikon~linkin_id-7000610?oq=nikon'
      end
      
      should "include products" do
        @categories.first.products.size.should == 5
      end
      
      context "when mapping products" do
        setup do
          @product = @categories.first.products.last
        end

        should "should map product attributes" do
          @product.id.should == 37724181
          @product.name.should == 'Nikon D40 Digital Camera with 18-55mm lens'
          @product.short_description.should == '6.24 Megapixel, SLR Camera, 2.5 in. LCD Screen, 3x Optical Zoom, Weight: 1.06 lb.'
          @product.min_price.should == 375.00
          @product.max_price.should == 600.00
          @product.product_offers_url.should == 'http://www.shopping.com/xPO-Nikon-D40-with-G-II-18-55mm-Lens~linkin_id-7000610'
          @product.product_specs_url.should == 'http://www.shopping.com/xPF-Nikon-D40-with-G-II-18-55mm-Lens~linkin_id-7000610'
        end
        
        context "when mapping offers" do
          setup do
            @offer = @product.offers.last
          end

          should "should include offer info" do
            @product.offers.size.should == 5
            @offer.featured?.should == true
            @offer.smart_buy?.should == false
            @offer.used?.should == false
            @offer.name.should == 'Nikon D40 6.1 Megapixel Digital SLR Camera 3X Zoom Kit Outfit, with 18-55mm f/3.5-5.6G ED II AF-S DX Zoom Nikkor Lens - Refurbished by Nikon U.S.A.'
            @offer.description.length.should_not == 0
            @offer.category_id.should == 7185
            @offer.manufacturer.should == 'Nikon'
            @offer.images.size.should == 4
            @offer.images.last.width.should == 400
            @offer.stock_status.should == 'in-stock'
            @offer.store_notes.should == 'Refurbished Model'
            #@offer.currency.should == 'USD'
            @offer.base_price.should == 374.95
            @offer.tax.should == nil
            @offer.shipping_cost.should == 0.00
            @offer.total_price.should == nil
            @offer.offer_url.include?('http://').should == true
          end
          
          context "when mapping store info" do
            setup do
              @store = @offer.store
            end

            should "should include store info" do
              @store.name.should == 'Adorama'
              @store.logo.height.should == 31
              @store.rating.should == 4.50
              @store.review_count.should == 6187
              @store.review_url.should == 'http://www.shopping.com/xMR-null~MRD-9391~S-1~linkin_id-7000610'
              @store.rating_image.source_url.should == 'http://img.shopping.com/sc/mr/sdc_checks_45.gif'
              @store.country_code.should == 'US'
            end
          end
          
        end
        
        should "include specifications" do
          @product.specifications.size.should == 15
        end
        
        context "when mapping feature groups" do
          setup do
            @feature_group = @product.specifications[1]
          end

          should "should include feature info" do
            @feature_group.features.size.should == 5
            @feature = @feature_group.features[3]
            @feature.name.should == 'Image Sensor Type'
            @feature.description.nil?.should == false
            @feature.values.first.should == 'CCD'
          end
        end
        
        
        should "include review info" do
          @product.review_count.should == 101
          @product.rating.should == 4.00
          @product.rating_image.source_url.should == 'http://img.shopping.com/sc/pr/sdc_stars_sm_4.gif'
          @product.reviews.size.should == 5
          @product.overall_rating.should == 4.00
          @product.feature_ratings.size.should == 5
          @product.feature_ratings.last.name.should == 'Shutter Lag'
          @product.feature_ratings.last.value.should == 4.64
        end
        
        context "when mapping consumer reviews" do
          setup do
            @review = @product.reviews.first
          end

          should "include review info" do
            @review.author_id.should == 'phill525'
            @review.post_date.yday.should == 124
            @review.rating.should == 5.00
            @review.feature_ratings.size.should == 5
            @review.feature_ratings.first.name.should == 'Ease of Use:'
            @review.feature_ratings.first.value.should == 4
            @review.summary.should == 'Nikon D40'
            @review.pros.should == 'Lots of features.<br>Easy to use.<br>Intuitive menu.'
            @review.cons.should == 'No video capture like most recent SLR\'s, but not really a "con".'
            @review.content.should == 'This is an EXCELLENT camera for the money.&nbsp; Don\'t be drawn to more expensive cameras just becau'
            @review.url.should == 'http://www.epinions.com/content_469199523460?linkin_id=7000610'
          end
        end
        
        context "when mapping images" do

          should "should include images" do
            #@product.images.size.should == 4
            @product.images.first.height.should == 100
            @product.images.last.width.should == 400
            @product.images.last.source_url.should == 'http://di1.shopping.com/images/pi/dd/9b/90/37724181-400x400-0-0.jpg?p=w2.8817498383328ac21657&a=2&c=1&l=7000610&t=090810232437&r=5'
          end
        end
        
      end
      
      
      should "include offers" do
        @categories.first.offers.size.should == 0
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