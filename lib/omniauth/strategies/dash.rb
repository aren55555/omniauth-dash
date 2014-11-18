require 'omniauth-oauth2'
require 'multi_json'

module OmniAuth
  module Strategies
    class Dash < OmniAuth::Strategies::OAuth2  
      option :name, 'dash'
      
      option :client_options, {
        :site => 'https://dash.by/',
        :authorize_url => 'https://dash.by/api/auth/authorize',
        :token_url => 'https://dash.by/api/auth/token'
      }
      
      def callback_url
        options[:callback_url] || super
      end      
    end
  end
end