# OmniAuth Dash Strategy

Strategy to authenticate with Dash via OAuth2 in OmniAuth

Get your API key at: https://dash.by/signup-form.html

For more details, read the Dash authorization documentation at https://dash.by/resources.html

## Installation

Add to your `Gemfile`:

````ruby
gem 'omniauth-dash'
````

then `bundle install`.


## Example

1. Clone this repo and `cd` into it
2. `bundle install` (Required [bundler gem](http://bundler.io/))
3. `cd examples`
4. Set ENV variables for DASH_ID and DASH_SECRET
5. Set redirect URI to http://localhost:9292/auth/dash/callback
6. `bundle exec rackup`
7. Open http://localhost:9292 in your browser and follow links

## Usage

In Rails add the following to `config/initializers/omniauth.rb`

````ruby
use OmniAuth::Builder do
  provider :dash, ENV['DASH_ID'], ENV['DASH_SECRET']
end
````

This will enable the route `/auth/dash` which will start the OAuth2 flow. See `examples/config.ru` for a fully working example.