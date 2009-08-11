module Shoppr
  class ConsumerReview
    include ROXML
    xml_convention {|val| val.camelize(:lower) }
    xml_reader :author_id, :from => 'authorID'
    xml_reader :post_date, :as => Time
    xml_reader :rating, :as => Float, , :from => '/rating/average_rating'
    xml_reader :summary
    xml_reader :bottom_line
    xml_reader :pros
    xml_reader :cons
    xml_reader :content, :from => 'reviewContent'
    xml_reader :url, :from => 'fullReviewURL'
  end
end