module Shoppr
  class Product
    include ROXML
    xml_convention {|val| val.camelize(:lower) }
    xml_reader :id, :from => '@id'
    xml_reader :name
    xml_reader :short_description
    xml_reader :full_description
    xml_reader :images, :as => [Image], :in => 'images'
    
    xml_reader :review_count, :as => Integer, :from => '/rating/review_count'
    xml_reader :rating, :as => Float, , :from => '/rating/rating'
    xml_reader :rating_image_url, :as => Image, :from => '/rating/rating_image/sourcURL'
    xml_reader :review_url, :from => 'reviewURL', :from => '/rating/reviewURL'
    
    xml_reader :reviews, :as => [ConsumerReview], :in => 'reviews'
    xml_reader :feature_ratings, :as => [FeatureRating], :in => '/reviews/average_rating'
    xml_reader :write_review_url, :from => '/reviews/writeReviewURL'
    
    xml_reader :min_price, :as => Float
    xml_reader :max_price, :as => Float
    xml_reader :product_offers_url, :from => 'productOffersURL'
    xml_reader :product_specs_url, :from => 'productSpecsURL'
    xml_reader :offers, :as => [Offer], :in => 'offers'
    xml_reader :specifications, :as => [FeatureGroup], :in => 'specifications'
    xml_reader :reviews, :as => Reviews
  end
end