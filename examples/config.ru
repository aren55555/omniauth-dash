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
  provider :dash, ENV['DASH_ID'], ENV['DASH_SECRET'], :scope => 'user trips', :callback_url => 'http://127.0.0.1:9292/auth/dash/callback'
end

run DashApp.new