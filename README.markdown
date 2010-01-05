# shoppr

The Ruby Shopping.com API gem. 

## Installation

    sudo gem install shoppr
    
## Usage

To use the Shopping.com API, you'll need an [API key]( http://developer.shopping.com/docs/Getting_Started)
    
    # Set up your API key
    Shoppr.api_key = 'OU812'
    
then just create a client
    
    client = Shoppr::Client.new
    
or if you want to use the sandbox test environment you can do so without an API key:

    client = Shoppr::Client.new(true)
    
### Searching for products by keyword

    client.search(:keyword => 'nikon')

### Searching for products by keyword showing product reviews

    client.search(:keyword => 'nikon', :show_product_reviews => true)
    
More scenario examples can be found on the [shopping.com API site](http://developer.shopping.com/docs/API_Use_Cases)

## docs

http://rdoc.info/projects/squeejee/shoppr

## Copyright

Copyright (c) 2009 Squeejee. See LICENSE for details.
