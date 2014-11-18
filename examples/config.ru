# Make sure to setup the ENV variables DASH_ID and DASH_SECRET
# Run with `bundle exec rackup`

require 'rubygems'
require 'bundler'
require 'sinatra'
require 'omniauth-dash'

class DashApp < Sinatra::Base

  get '/' do
    <<-HTML
      <p><a href="/auth/dash">Sign into Dash</a></p>
    HTML
  end

  get '/auth/:provider/callback' do |provider|
    content_type 'text/plain'
    %{ #{provider} token: #{request.env['omniauth.auth'].to_hash['credentials'].inspect}
     } rescue 'No data returned'
  end

  get '/auth/failure' do
    content_type 'text/plain'
    %{ Error: #{request.env['omniauth.auth'].to_hash.inspect}
     } rescue 'No data returned'
  end
end

use Rack::Session::Cookie, :secret => 'abc'

use OmniAuth::Builder do
  provider :dash, 'MWM3ZTg1N2EtZDA4Yy00N2E4LWEzODgtZmI4ZjI3YWFlOGUw', 'MmJiMGQ5YTEtYWY5NS00NjFkLWEwOTctOWFjNTM4ZGE3ZDU2t'
end

run DashApp.new