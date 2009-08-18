# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{shoppr}
  s.version = "0.1.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Wynn Netherland", "Jim Mulholland"]
  s.date = %q{2009-08-17}
  s.email = %q{wynn@squeejee.com}
  s.extra_rdoc_files = [
    "README.rdoc"
  ]
  s.files = [
    "History",
     "License",
     "README.rdoc",
     "Rakefile",
     "VERSION.yml",
     "lib/shoppr.rb",
     "lib/shoppr/api_exception.rb",
     "lib/shoppr/attribute.rb",
     "lib/shoppr/attribute_selection.rb",
     "lib/shoppr/attribute_value.rb",
     "lib/shoppr/category.rb",
     "lib/shoppr/category_selection.rb",
     "lib/shoppr/client.rb",
     "lib/shoppr/client_tracking.rb",
     "lib/shoppr/consumer_review.rb",
     "lib/shoppr/dynamic_navigation_history.rb",
     "lib/shoppr/feature.rb",
     "lib/shoppr/feature_group.rb",
     "lib/shoppr/feature_rating.rb",
     "lib/shoppr/general_search_response.rb",
     "lib/shoppr/generic_response.rb",
     "lib/shoppr/image.rb",
     "lib/shoppr/keyword_search.rb",
     "lib/shoppr/offer.rb",
     "lib/shoppr/offer_selection.rb",
     "lib/shoppr/product.rb",
     "lib/shoppr/product_selection.rb",
     "lib/shoppr/search_history.rb",
     "lib/shoppr/server_detail.rb",
     "lib/shoppr/store.rb",
     "test/fixtures/general_search_specs_offers_reviews.xml",
     "test/fixtures/generic_response.xml",
     "test/fixtures/nikon.xml",
     "test/fixtures/no_options.xml",
     "test/shoppr/client_test.rb",
     "test/shoppr/general_search_response_test.rb",
     "test/shoppr/generic_response_test.rb",
     "test/test_helper.rb"
  ]
  s.homepage = %q{http://github.com/squeejee/shoppr}
  s.rdoc_options = ["--charset=UTF-8"]
  s.require_paths = ["lib"]
  s.rubyforge_project = %q{shoppr}
  s.rubygems_version = %q{1.3.3}
  s.summary = %q{Ruby wrapper for the Shopping.com API}
  s.test_files = [
    "test/shoppr/client_test.rb",
     "test/shoppr/general_search_response_test.rb",
     "test/shoppr/generic_response_test.rb",
     "test/test_helper.rb"
  ]

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 3

    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<mash>, ["= 0.0.3"])
      s.add_runtime_dependency(%q<httparty>, ["= 0.4.3"])
      s.add_development_dependency(%q<thoughtbot-shoulda>, [">= 0"])
      s.add_development_dependency(%q<jeremymcanally-matchy>, [">= 0"])
      s.add_development_dependency(%q<mocha>, [">= 0"])
      s.add_development_dependency(%q<fakeweb>, [">= 0"])
      s.add_development_dependency(%q<mash>, [">= 0"])
    else
      s.add_dependency(%q<mash>, ["= 0.0.3"])
      s.add_dependency(%q<httparty>, ["= 0.4.3"])
      s.add_dependency(%q<thoughtbot-shoulda>, [">= 0"])
      s.add_dependency(%q<jeremymcanally-matchy>, [">= 0"])
      s.add_dependency(%q<mocha>, [">= 0"])
      s.add_dependency(%q<fakeweb>, [">= 0"])
      s.add_dependency(%q<mash>, [">= 0"])
    end
  else
    s.add_dependency(%q<mash>, ["= 0.0.3"])
    s.add_dependency(%q<httparty>, ["= 0.4.3"])
    s.add_dependency(%q<thoughtbot-shoulda>, [">= 0"])
    s.add_dependency(%q<jeremymcanally-matchy>, [">= 0"])
    s.add_dependency(%q<mocha>, [">= 0"])
    s.add_dependency(%q<fakeweb>, [">= 0"])
    s.add_dependency(%q<mash>, [">= 0"])
  end
end
